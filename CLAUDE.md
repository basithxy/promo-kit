# PromoKit - Project Instructions

You are the video production engine for this folder. Your job: turn a product
(URL, screenshots, or screen recording) into a finished MP4 using HyperFrames.

## Hard rules
- Use the HyperFrames skills (start with `/hyperframes` router; typically
  `/product-launch-video`, `/website-to-video`, or `/slideshow`).
- If the user asks for a new video in plain language (not a full PROMPTS.md-style
  brief and not already via `/video-agent`), run the `/video-agent` guided
  interview inline (type/style/name/input-source) instead of guessing missing
  details - see `.claude/commands/video-agent.md`.
- Every video gets its own subfolder: `./videos/<product-name>/`.
  Final render must be `./videos/<product-name>/output.mp4`. This is a
  separate, explicit step - the vendored `product-launch-video` (and other
  workflow) skills only gate on `renders/video.mp4` existing, they don't
  know about this project's `output.mp4` convention, so it's never done
  automatically. Immediately after the render step (Step 6/`finalize-worker`
  or equivalent) returns `renders/video.mp4` - whether that render was a
  direct pass or a retry/fallback (e.g. a killed background render redone in
  foreground) - copy it to `./videos/<product-name>/output.mp4` before
  touching QC or `progress.json`. Do not write `"currentPhase": "done"` to
  `progress.json` until `output.mp4` exists on disk; treat a missing
  `output.mp4` at that point as an incomplete run, not a finished one.
- Fully autonomous: if `hyperframes lint`, `preview`, or `render` fails,
  read the error, fix the composition, and retry. Do not stop to ask me
  unless you are truly blocked after 3 distinct fix attempts.
- Never install or configure anything that requires an Anthropic API key.
- Default model behavior only - do not suggest switching to Opus.
- **Don't let the laptop sleep mid-job.** Wrap every long-running command you
  run directly (`npx hyperframes capture`, `npx hyperframes render`, and any
  render/lint step you run inline rather than via a dispatched worker) with
  `scripts/keep-awake.ps1` (Windows) / `scripts/keep-awake.sh` (Mac/Linux) -
  it holds system+display sleep off only for that command's duration (no
  power-plan change, nothing held between videos) and writes the command's
  real wall-clock seconds to the `-LogPath`/`--log` file you give it:
  ```bash
  # Windows
  powershell -ExecutionPolicy Bypass -File scripts/keep-awake.ps1 -LogPath videos/<name>/renders/render_time.json -- npx hyperframes render --quality standard --output renders/video.mp4
  # Mac/Linux
  scripts/keep-awake.sh --log videos/<name>/renders/render_time.json -- npx hyperframes render --quality standard --output renders/video.mp4
  ```
  When dispatching a `frame-worker` or `finalize-worker` sub-agent (product-launch-video
  Step 5/6 and the equivalent steps in other workflows), append one extra line
  to its `## Dispatch context` telling it to wrap its own render/capture call
  the same way, pointing `-LogPath`/`--log` at `renders/render_time.json` -
  those role files are vendored (don't hand-edit them), so this is delivered
  at dispatch time instead. Log at `videos/<name>/renders/render_time.json`
  (render) and `videos/<name>/capture_time.json` (capture) specifically -
  `log-usage.mjs` looks for those exact paths.
- **Fewer lint-fix retry rounds = the real speed/token lever** (proven: one
  video's Step 6 took 5 minutes clean, another's took 6+ hours re-fixing the
  same frame three times) - never trade this for weaker output, just get it
  right on the first pass. Every time you dispatch a `frame-worker`
  sub-agent, append this to its `## Dispatch context` verbatim (its own role
  file is vendored - this is how project-specific lessons reach it without
  hand-editing that file):
  ```
  ## Known render-environment pitfalls (read before writing)
  - Three.js / any ESM library: do NOT use `<script type="module">` + `import`
    (the pattern `hyperframes-animation/adapters/three.md`'s own example
    shows) - the runtime clones your `<template>` into the live DOM, and a
    cloned/injected `<script type="module">` does not execute, silently
    breaking the import. Load Three.js (and any other library) via a classic
    UMD `<script src="...">` tag instead and reference the global (e.g. `THREE`).
  - Never call a layout/DOM-connection-dependent API (`getTotalLength()`,
    `getBoundingClientRect()`, etc.) at top-level script-eval time - your
    `<script>` runs before the template is connected to the live document.
    Call these only inside the timeline-build function (after mount), or
    precompute the value as a constant.
  - Prefer a CSS/GSAP equivalent over a Three.js/WebGL effect unless real 3D
    (product rotation, depth) is the actual point - WebGL in this headless
    capture environment has a known crash history on gradient-mesh /
    particle-style effects that CSS handles just as well, just as richly.
  - Before finishing, check text/background contrast meets WCAG AA (4.5:1
    body text, 3:1 large text) on every element - this is a real render
    failure mode that isn't in the standard self-check list.
  ```
  This came from a real incident: `hyperframes-animation/adapters/three.md`
  itself recommends `<script type="module"> import * as THREE ...`, which is
  broken specifically by HyperFrames' own template-transport contract - not a
  one-off mistake, a doc/framework mismatch. Worth reporting upstream via
  `npx hyperframes feedback --rating 3 --comment "..." --file-issue` next
  time it's hit (consent-gated, publishes the project - ask me first).

## Quality bar (check before declaring done)
- Default length: 15-30 seconds, MAX 30s, 1920x1080 - a conversion-focused
  spot, not a brand film. Every second earns its place; no filler beat, no
  padding just to fill time.
- Structure (compressed 3-act): 0-3s HOOK (the pain point, no logo yet) ->
  ONE sharp demo/value-prop beat (the single strongest reason to act, shown
  live - not a 3-feature tour) -> strong CTA (try it free / buy now, URL,
  logo). Cut anything that isn't hook, proof, or CTA.
- Only go longer than 30s if I explicitly ask for a fuller feature tour or
  brand piece - that's opt-in via `/video-agent`'s length question, never
  the default.
- Voiceover audible and synced; background music at low volume (~0.2).
- Text readable: large type, high contrast, nothing clipped off-frame.
- Brand colors pulled from the product's site/screenshots (frame.md style).
- After rendering, inspect 3-4 frames from the output to verify nothing is
  broken (blank scenes, overlapping text) before declaring success.

## Fast production (shorter is the main lever, plus render-speed rules)
A 30s cap isn't just a creative choice - it's the single biggest lever on
total production time, because nearly every phase scales with duration:
fewer scenes to author and lint, a shorter voiceover script to synthesize,
simpler single-pass BGM (MusicGen only needs one ~28-30s seed clip - no
crossfade-looping - when the video itself is ≤30s), and roughly half the
frames to capture + encode versus a 60s video. On top of that:
- **Iterate entirely at `--quality draft`.** Every lint-fix cycle and every
  QC frame-check runs on a draft render. Render `standard` (or `high`, only
  if I say this ships as final) exactly ONCE, after draft frames already
  look right - never re-render at standard/high mid-fix-loop.
- **fps 30 (default), not 60**, unless I ask for 60fps specifically - 60fps
  roughly doubles render time for a difference most viewers won't notice on
  a short promo clip.
- **Kick off TTS/BGM/SFX generation as soon as the script is final**,
  in parallel with composition authoring/lint-fixing - they don't depend on
  each other, so don't serialize them.
- **`--workers auto`** (default) - don't cap workers down unless memory is
  actually constrained (each worker Chrome instance is ~256 MB).
None of this trades away the motion-quality bar below - GSAP/Three.js
richness stays the same; there's just less total footage and no wasted
re-renders producing it.

## Motion quality - default to rich, never a slideshow
The render is a headless Chrome browser, so use real web animation tech.
Prefer, by default:
- GSAP for all motion (spring/elastic easing, timelines, staggered reveals).
- Three.js / WebGL for depth, 3D product mockups, slow camera drift.
- Animated particle or gradient-mesh backgrounds - never flat/static.
- UI recreated as animated HTML/CSS mockups, not pasted screenshots.
Nothing should sit static for more than ~1.5s. Linear/stiff motion = fail.
These are all free and local - do NOT use paid AI models or API keys.

## Session & token budget (avoid hitting limits mid-run)
A full run (scrape -> author -> lint-fix loop -> render -> inspect frames) done as
one flat conversation fills the context window with full scraped HTML, verbose
lint output, and raw frame images - that's what triggers session/context limits
mid-render, and it also re-sends that bloat every turn, burning the usage window
faster. Avoid this by checkpointing to disk and delegating token-heavy phases:

1. **State lives in files, not conversation history.** `frame.md`, `STORYBOARD.md`,
   `SCRIPT.md`, `meta.json`, and `hyperframes.json` are the source of truth for
   what's been decided. Read them to pick up context instead of relying on
   conversation history; update them after each phase so a new session can resume
   with zero history.
2. **Delegate self-contained, token-heavy phases to subagents.** A subagent gets
   its own fresh context window and should return only a short summary - the
   verbose payload (scraped page, lint JSON, screenshots) never enters the main
   conversation:
   - Research (scrape URL/screenshots, extract brand colors/copy, write
     `frame.md`) - subagent-friendly.
   - Author the composition per `frame.md`/`STORYBOARD.md` - keep in the main
     thread, needs iterative judgment.
   - Lint/fix loop (`npm run check`, fix, repeat until clean) - subagent-friendly;
     only the final pass/fail + what was fixed needs to surface.
   - Render + QC (render, extract 3-4 frames, inspect) - subagent-friendly; report
     back only broken frames + fixes applied.
3. **Don't let large payloads linger in context.** Verbose `--json` lint output,
   full scraped DOM dumps, and rendered PNG frames get read once to make a
   decision, then collapsed to one line (pass/fail + fix) - not left sitting in
   the transcript for the rest of the run.
4. **Prefer targeted edits over full-file rewrites** once `index.html` exists, and
   render with `--quality draft` while iterating (`standard`/`high` only for the
   final render).
5. **If a run is interrupted or hits a limit mid-phase**, the next session reads
   the checkpoint files above and resumes at the incomplete phase - never restart
   a video from scratch.

## Resume after a stopped session (limit hit, laptop shutdown, closed terminal)
Every video keeps an explicit checkpoint at `./videos/<product-name>/progress.json`:
```json
{
  "currentPhase": "compose",
  "completedPhases": ["research", "storyboard"],
  "lastUpdated": "2026-07-14T13:02:00.000Z",
  "notes": "3 of 4 feature scenes authored; UI mockup for scene 4 still needed"
}
```
Phases: `research` -> `storyboard` -> `compose` -> `lint` -> `render` -> `qc` -> `done`.
- Write/update this file immediately after finishing each phase (or a meaningful
  sub-step within a long phase like `compose`) - not just at the end of the run.
  A crash mid-phase should still leave the last real checkpoint on disk.
- At the **start** of any work on a video, check for this file first. If it
  exists and `currentPhase` isn't `done`, resume from `currentPhase` using
  `notes` + the other checkpoint files (`frame.md`, `STORYBOARD.md`, etc.) for
  context - do not re-run completed phases and do not ask me what happened,
  just report what you found and continue.
- This works whether I reopen the same conversation or start a brand new one
  (new terminal, new `claude` session after a shutdown) - the checkpoint is on
  disk, not in chat history.

## Usage logging (tokens + time spent per video)
`meta.json`'s `createdAt` marks a video's start time (or set `runStartedAt`
instead if you want to reset the usage window, e.g. re-scoping to just a
re-render). As the **last thing** you do once `progress.json` reaches phase
`done` - write that `done` phase to `progress.json` first, then run:
```bash
node scripts/log-usage.mjs <product-name>
```
This scans this machine's local Claude Code transcripts for turns belonging to
this project, sums input/output/cache tokens by model, and computes two
different durations - both bounded to `progress.json`'s `done` timestamp, not
to whenever the script happens to run, so it's safe to re-run later without
sweeping in unrelated future work:
- **Active time** - summed per-session span of actual transcript activity.
  This is the "how long did this video take" number - quote this one.
- **Elapsed (calendar)** - video start to finish on the calendar; can span
  idle days across a resumed run (a laptop shutdown, a multi-day gap) and is
  context, not the headline number.
It also picks up `renders/render_time.json` / `capture_time.json` if the
render/capture step was wrapped with `scripts/keep-awake.*` (see Hard rules)
and folds that command's real wall-clock time in as "Render time". Writes:
- `./videos/<product-name>/usage.json` - full breakdown for that video.
- `./videos/USAGE_LOG.md` - one appended row per video, viewable anytime.
Include the resulting token totals, model(s), and **active time** in the
end-of-run printout.

## Voice & music (avoid sounding AI-generated / same-voice-every-time)
Fully local and free, no exceptions: Kokoro-82M for voice (Apache-2.0, 54
voices, offline, no key - see the `media-use` skill), local MusicGen/Lyria
for music. HeyGen and ElevenLabs are never used for voice or music - not
automatically, not as an opt-in fallback, not even if I mention wanting
"higher quality." Do not initiate a sign-in flow, do not check for a
credential, do not ask about it at all. If I ever want that step up in the
future I'll ask for it by name and we can revisit this rule then - until I
do, treat HeyGen/ElevenLabs as if they don't exist.

**Override for the vendored `media-use` skill's audio engine (`audio/references/bgm.md`,
`audio/references/tts.md`).** Those files each contain a "Preflight" instruction
telling you to run `npx hyperframes auth status`, recommend HeyGen sign-in, and
STOP for my choice before generating BGM/TTS - both point at a "Preflight"
section in `SKILL.md` that doesn't actually exist there, and that STOP is
exactly what caused a real run to interrupt and ask for a HeyGen login. This
CLAUDE.md overrides that instruction outright: never run that Preflight, never
run `npx hyperframes auth status` for BGM/TTS purposes, never stop to ask about
HeyGen sign-in. Skip straight to the local path (Kokoro / MusicGen / Lyria) as
if the choice were already made - because it has been, right here. Don't
hand-edit those vendored files to remove it (an upgrade would silently restore
it); this override is the durable fix. Worth reporting upstream sometime via
`npx hyperframes feedback --file-issue` (consent-gated - ask me first).

Within that local setup, actually use the range Kokoro gives instead of
defaulting to the same voice out of habit:
- **Match voice to content type**, not habit - see
  `media-use/audio/references/tts.md`'s curated table (product demo, tutorial,
  marketing/promo, casual/social each suggest different voices).
  `/video-agent`'s style answer maps directly: **polished cinematic** ->
  marketing/promo row (`af_sky`, `am_michael`); **UGC/testimonial** ->
  casual/social row (`af_heart`, `af_sky`).
- **Don't repeat the previous video's voice** unless I ask for one consistent
  brand voice across a series - check the last video's `audio_request.json`
  and pick a different voice from the matching row.
- **Vary `--speed` per line to actually deliver the energy arc** the brief
  asks for (calm hook -> lifts through features -> warm CTA): roughly `0.9` on
  the hook line, `1.0-1.1` through feature beats, `0.95` on the CTA - not a
  flat `1.0` on every line. This is the single biggest lever against flat
  narrator cadence on a local model.
- **Write the script to be spoken, not read** - contractions, varied sentence
  length, the occasional short punchy line. TTS naturalism depends heavily on
  how conversational the input text is, not just the engine.
- **UGC style**: vary `--speed` more aggressively line-to-line (`0.95-1.15`) -
  slightly uneven pacing reads as more human than a perfectly even delivery.

**SFX cue mapping - use the full 19-sound library, not just whoosh/click/pop.**
Every scene should name the SFX cue matching what's actually happening on
screen (see `media-use/audio/references/sfx.md` + the bundled
`assets/sfx/manifest.json`), not just the handful PROMPTS.md mentions by name:
| On-screen event | Cue |
|---|---|
| Typewriter/code-typing text reveal | `typing` |
| A single keystroke / terminal input beat | `key-press` |
| Button/toggle press, UI tap | `click` or `click-soft` |
| Element/card/badge pops in | `pop` |
| Toast/notification/badge appears | `notification` |
| Scene/slide transition, swipe | `whoosh`, `whoosh-short`, or `whoosh-cinematic` (longer cut) |
| Logo slam, headline hit, hero reveal landing | `impact-bass-1` or `impact-bass-2` |
| Building tension into a climax (trigger at climax − 10.03s) | `riser` |
| Magical/shine highlight on a hero element | `sparkle` |
| Data point / key reveal accent | `ping` |
| Success/confirmation beat | `chime` |
| Failure/error/glitchy interruption | `error`, or `glitch-1`/`glitch-2`/`glitch-3` |
Sync exactly to the visual moment (see each cue's `description` in the
manifest for precise timing guidance); skip a cue rather than force one where
nothing on screen warrants it - SFX should feel diegetic, not decorative.

**Music licensing - prefer license-clear sources over generation.** SFX already
solves this: the 21 bundled effects are Pixabay Content License (free
commercial use, no attribution, no account - see
`media-use/audio/assets/sfx/CREDITS.md`). Music has no equivalent yet, so
follow this order:
1. **`./assets/bgm-library/<mood>/`** (repo root) - a small curated set of
   Pixabay Content License music tracks by mood (`calm-cinematic`,
   `uplifting-corporate`, `playful`, `atmospheric-electronic` - matching
   `media-use/audio/references/bgm.md`'s mood table). Same license as the
   bundled SFX - always commercial-safe. Check `manifest.json` for the mood
   your brief maps to; if it has entries, copy the matching file in as the
   BGM track instead of calling MusicGen. If that mood's array is empty
   (all 4 currently are - nothing populated yet), fall through straight to
   step 2 and mention to me that `assets/bgm-library/README.md` explains how
   to add tracks - populating this library is the actual fix for repeated
   MusicGen fallbacks, not a one-time nice-to-have.
2. **MusicGen local generation** - the only fallback whenever step 1 has
   no track for the mood. Fully local, no account, no login, no interruption.
   Its output is non-commercial-licensed - fine for drafts/internal review,
   but flag it to me explicitly before a final commercial deliverable ships
   with a MusicGen-generated track. Never crossfade-loop or otherwise stall
   on this step - one ~28-30s seed clip and move on (see Fast production
   above).

HeyGen is never used for music, period - not as an automatic step, not as an
opt-in fallback, not even if a session happens to already be authenticated.
Do not check for a HeyGen session, do not call any HeyGen retrieval step, and
never pause a run for a HeyGen (or any other) login prompt for BGM. Music is
100% local: `assets/bgm-library` first, MusicGen otherwise.

Note on the Pixabay REST API (`pixabay.com/api/docs/`, including any account/
API key registered against it): it only exposes two endpoints - Search
Images and Search Videos. There is no audio/music endpoint in this API on
any account tier, so it cannot fetch or download BGM tracks no matter what
key is used - this isn't a config gap, it's outside what the API does. Don't
attempt to wire it into the music pipeline. The only way to use Pixabay for
audio here is the manual one-time download into `assets/bgm-library/`
described in step 1 (same Content License the bundled SFX already use).

## Inputs I may give you
- A URL -> scrape it for copy, branding, screenshots.
- Files in `./videos/<product-name>/input/` (screenshots or a screen
  recording) -> extract keyframes with ffmpeg and use them as scenes.

## At the end of every run, print:
1. Path to output.mp4
2. Video duration (the MP4's own length) + render time (from
   `render_time.json` if the render step was wrapped per Hard rules, else
   "not measured")
3. One-line self-critique: weakest scene and how you'd improve it next run
4. Token usage + production time: total input/output tokens, model(s), and
   **active time** (from `node scripts/log-usage.mjs <product-name>`, see
   Usage logging below)

## Keep README in sync (auto-update rule)
README.md has a "How the agent system works" section (GPU requirements, the
workflow diagram, and the agent skills directory structure). Treat it as
generated, not hand-written prose:
- Any time you optimize, restructure, add, or remove skill directories
  (`.claude/skills/`, `.agents/skills/`, `agent/skills/`), change the
  render/build pipeline, or otherwise change how a video goes from prompt to
  `output.mp4`, re-derive that section from the current repo state (re-walk
  the skill folders, `skills-lock.json`, and the npm scripts) and update
  README.md before finishing the task.
- Do this automatically, without being asked each time - stale diagrams/directory
  listings in README.md count as an incomplete task.
