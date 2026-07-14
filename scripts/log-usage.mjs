#!/usr/bin/env node
// Sums Claude Code token usage (input/output/cache, by model) spent on one
// video, by scanning this machine's local Claude Code transcripts for entries
// matching this project's cwd with a timestamp >= the video's start time.
// Scans every transcript file for the project, not just one session, so a
// video that spanned a resume (limit hit / restart) still totals correctly.
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

const claudeProjectsRoot = path.join(os.homedir(), ".claude", "projects");
const normalize = (p) => p.replace(/\\/g, "/").toLowerCase();
const targetCwd = normalize(projectDir);

const totals = {}; // model -> { input, output, cacheRead, cacheCreate }
const sessionsSeen = new Set();

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
      if (new Date(entry.timestamp).getTime() < since) continue;

      const usage = entry.message?.usage;
      if (!usage) continue;
      const model = entry.message.model || "unknown";
      totals[model] ??= { input: 0, output: 0, cacheRead: 0, cacheCreate: 0 };
      totals[model].input += usage.input_tokens || 0;
      totals[model].output += usage.output_tokens || 0;
      totals[model].cacheRead += usage.cache_read_input_tokens || 0;
      totals[model].cacheCreate += usage.cache_creation_input_tokens || 0;
      sessionsSeen.add(entry.sessionId);
    }
  }
}

const finishedAt = new Date().toISOString();
const usageRecord = {
  video: videoName,
  startedAt,
  finishedAt,
  sessionsSpanned: sessionsSeen.size,
  totalsByModel: totals,
};
fs.writeFileSync(path.join(videoDir, "usage.json"), JSON.stringify(usageRecord, null, 2));

const logPath = path.join(projectDir, "videos", "USAGE_LOG.md");
if (!fs.existsSync(logPath)) {
  fs.writeFileSync(
    logPath,
    "# PromoKit token usage log\n\n" +
      "| Video | Finished | Model(s) | Input tokens | Output tokens | Cache read tokens | Sessions spanned |\n" +
      "|---|---|---|---|---|---|---|\n"
  );
}
const sumField = (f) => Object.values(totals).reduce((a, t) => a + t[f], 0);
const row = `| ${videoName} | ${finishedAt} | ${Object.keys(totals).join(", ") || "none"} | ${sumField("input")} | ${sumField("output")} | ${sumField("cacheRead")} | ${sessionsSeen.size} |\n`;
fs.appendFileSync(logPath, row);

console.log(row.trim());
console.log(JSON.stringify(usageRecord, null, 2));
