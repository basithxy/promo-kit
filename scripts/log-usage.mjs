#!/usr/bin/env node
// Sums Claude Code token usage (input/output/cache, by model) and wall-clock
// time spent on one video, by scanning this machine's local Claude Code
// transcripts for entries matching this project's cwd with a timestamp >=
// the video's start time. Scans every transcript file for the project, not
// just one session, so a video that spanned a resume (limit hit / restart)
// still totals correctly.
//
// Two different "how long did this take" numbers are computed, because they
// answer different questions:
//   - activeSeconds  - sum, per Claude Code session touching this project,
//                       of (last transcript entry - first transcript entry).
//                       This is "how long was the agent actually working,"
//                       and is the number to quote for "how long does one
//                       video take."
//   - elapsedSeconds - video start (meta.json createdAt/runStartedAt) to now.
//                       This is calendar time and can span idle days between
//                       resumed sessions - kept for context, not as the
//                       headline duration.
// If a render/capture step was wrapped with scripts/keep-awake.(ps1|sh)
// --log, its timing file (renders/render_time.json, capture_time.json) is
// picked up too, giving the actual CLI-command wall-clock time.
//
// Usage: node scripts/log-usage.mjs <video-name>
// Start time is meta.json's "runStartedAt" if present, else its "createdAt"
// (already written by hyperframes init at scaffold time).

import fs from "node:fs";
import path from "node:path";
import os from "node:os";

const videoName = process.argv[2];
if (!videoName) {
  console.error("Usage: node scripts/log-usage.mjs <video-name>");
  process.exit(1);
}

const projectDir = process.cwd();
const videoDir = path.join(projectDir, "videos", videoName);
const metaPath = path.join(videoDir, "meta.json");
if (!fs.existsSync(metaPath)) {
  console.error(`No meta.json at ${metaPath}`);
  process.exit(1);
}

const meta = JSON.parse(fs.readFileSync(metaPath, "utf8"));
const startedAt = meta.runStartedAt || meta.createdAt;
if (!startedAt) {
  console.error('meta.json has no "runStartedAt" or "createdAt" - add one (ISO timestamp) to mark the video\'s start time.');
  process.exit(1);
}
const since = new Date(startedAt).getTime();

// End boundary: without this, re-running the script after a video is already
// `done` sweeps in every later, unrelated Claude Code turn in this project
// directory (other videos, doc edits, anything) between then and "now" -
// silently inflating tokens/sessions/time for a video that finished long
// ago. Bound to the video's own completion timestamp so this script is safe
// to re-run at any point without corrupting an already-finished video's log.
const progressPath = path.join(videoDir, "progress.json");
let until = Date.now();
let untilSource = "now (video still in progress)";
if (fs.existsSync(progressPath)) {
  try {
    const progress = JSON.parse(fs.readFileSync(progressPath, "utf8"));
    if (progress.currentPhase === "done" && progress.lastUpdated) {
      until = new Date(progress.lastUpdated).getTime();
      untilSource = "progress.json lastUpdated (phase: done)";
    }
  } catch {
    // fall through to "now"
  }
}

function fmtDuration(totalSeconds) {
  if (totalSeconds == null || !Number.isFinite(totalSeconds)) return "n/a";
  const s = Math.round(totalSeconds);
  const d = Math.floor(s / 86400);
  const h = Math.floor((s % 86400) / 3600);
  const m = Math.floor((s % 3600) / 60);
  const sec = s % 60;
  const parts = [];
  if (d) parts.push(`${d}d`);
  if (h) parts.push(`${h}h`);
  if (m) parts.push(`${m}m`);
  if (!d && !h) parts.push(`${sec}s`);
  return parts.join(" ") || "0s";
}

function readTimingFile(...relParts) {
  const p = path.join(videoDir, ...relParts);
  if (!fs.existsSync(p)) return null;
  try {
    const data = JSON.parse(fs.readFileSync(p, "utf8"));
    return typeof data.seconds === "number" ? data.seconds : null;
  } catch {
    return null;
  }
}

const claudeProjectsRoot = path.join(os.homedir(), ".claude", "projects");
const normalize = (p) => p.replace(/\\/g, "/").toLowerCase();
const targetCwd = normalize(projectDir);

const totals = {}; // model -> { input, output, cacheRead, cacheCreate }
const sessionSpans = new Map(); // sessionId -> { min, max }

if (fs.existsSync(claudeProjectsRoot)) {
  for (const projFolder of fs.readdirSync(claudeProjectsRoot)) {
    const full = path.join(claudeProjectsRoot, projFolder);
    if (!fs.statSync(full).isDirectory()) continue;
    for (const file of fs.readdirSync(full)) {
      if (!file.endsWith(".jsonl")) continue;
      const lines = fs.readFileSync(path.join(full, file), "utf8").split("\n").filter(Boolean);
      for (const line of lines) {
        let entry;
        try {
          entry = JSON.parse(line);
        } catch {
          continue;
        }
        if (entry.type !== "assistant" || !entry.cwd) continue;
        if (normalize(entry.cwd) !== targetCwd) continue;
        const ts = new Date(entry.timestamp).getTime();
        if (ts < since || ts > until) continue;

        const usage = entry.message?.usage;
        if (usage) {
          const model = entry.message.model || "unknown";
          totals[model] ??= { input: 0, output: 0, cacheRead: 0, cacheCreate: 0 };
          totals[model].input += usage.input_tokens || 0;
          totals[model].output += usage.output_tokens || 0;
          totals[model].cacheRead += usage.cache_read_input_tokens || 0;
          totals[model].cacheCreate += usage.cache_creation_input_tokens || 0;
        }

        if (entry.sessionId) {
          const span = sessionSpans.get(entry.sessionId) || { min: ts, max: ts };
          span.min = Math.min(span.min, ts);
          span.max = Math.max(span.max, ts);
          sessionSpans.set(entry.sessionId, span);
        }
      }
    }
  }
}

const activeSeconds = [...sessionSpans.values()].reduce((sum, { min, max }) => sum + (max - min) / 1000, 0);

const finishedAt = new Date(until).toISOString();
const elapsedSeconds = (until - since) / 1000;

const renderSeconds = readTimingFile("renders", "render_time.json");
const captureSeconds = readTimingFile("capture_time.json");

const usageRecord = {
  video: videoName,
  startedAt,
  finishedAt,
  finishedAtSource: untilSource,
  sessionsSpanned: sessionSpans.size,
  activeSeconds: Math.round(activeSeconds),
  activeTime: fmtDuration(activeSeconds),
  elapsedSeconds: Math.round(elapsedSeconds),
  elapsedTime: fmtDuration(elapsedSeconds),
  renderSeconds,
  renderTime: renderSeconds != null ? fmtDuration(renderSeconds) : null,
  captureSeconds,
  captureTime: captureSeconds != null ? fmtDuration(captureSeconds) : null,
  totalsByModel: totals,
};
fs.writeFileSync(path.join(videoDir, "usage.json"), JSON.stringify(usageRecord, null, 2));

const logPath = path.join(projectDir, "videos", "USAGE_LOG.md");
const header =
  "# PromoKit token usage log\n\n" +
  "| Video | Finished | Model(s) | Input tokens | Output tokens | Cache read tokens | Sessions spanned | Active time | Elapsed (calendar) | Render time |\n" +
  "|---|---|---|---|---|---|---|---|---|---|\n";
if (!fs.existsSync(logPath)) {
  fs.writeFileSync(logPath, header);
}
const sumField = (f) => Object.values(totals).reduce((a, t) => a + t[f], 0);
const row =
  `| ${videoName} | ${finishedAt} | ${Object.keys(totals).join(", ") || "none"} | ${sumField("input")} | ` +
  `${sumField("output")} | ${sumField("cacheRead")} | ${sessionSpans.size} | ${usageRecord.activeTime} | ` +
  `${usageRecord.elapsedTime} | ${usageRecord.renderTime || "not measured"} |\n`;
fs.appendFileSync(logPath, row);

console.log(row.trim());
console.log(JSON.stringify(usageRecord, null, 2));
