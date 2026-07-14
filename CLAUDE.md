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
  Final render must be `./videos/<product-name>/output.mp4`.
- Fully autonomous: if `hyperframes lint`, `preview`, or `render` fails,
  read the error, fix the composition, and retry. Do not stop to ask me
  unless you are truly blocked after 3 distinct fix attempts.
- Never install or configure anything that requires an Anthropic API key.
- Default model behavior only - do not suggest switching to Opus.

## Quality bar (check before declaring done)
- 45-90 seconds, 1920x1080.
- Clear 3-act structure: hook (problem) -> product demo/features -> CTA.
- Voiceover audible and synced; background music at low volume (~0.2).
- Text readable: large type, high contrast, nothing clipped off-frame.
- Brand colors pulled from the product's site/screenshots (frame.md style).
- After rendering, inspect 3-4 frames from the output to verify nothing is
  broken (blank scenes, overlapping text) before declaring success.

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

## Usage logging (tokens + model spent per video)
`meta.json`'s `createdAt` marks a video's start time (or set `runStartedAt`
instead if you want to reset the usage window, e.g. re-scoping to just a
re-render). After finishing a video (phase `done` in `progress.json`), run:
```bash
node scripts/log-usage.mjs <product-name>
```
This scans this machine's local Claude Code transcripts for turns belonging to
this project since that timestamp, sums input/output/cache tokens by model
across every session the video touched (so it's still accurate after a
resume), and writes:
- `./videos/<product-name>/usage.json` - full per-model breakdown for that video.
- `./videos/USAGE_LOG.md` - one appended row per video, viewable anytime.
Include the resulting token totals + model(s) used in the end-of-run printout.

## Voice & music (avoid sounding AI-generated / same-voice-every-time)
Default is fully local and free: Kokoro-82M for voice (Apache-2.0, 54 voices,
offline, no key - see the `media-use` skill), local MusicGen/Lyria for music.
Keep it this way by default - only switch to HeyGen/ElevenLabs (needs signing
in to an account) if I explicitly ask for that step up in quality.

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

**SFX cue mapping - use the full 21-sound library, not just whoosh/click/pop.**
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
   BGM track instead of calling HeyGen or MusicGen. If that mood's array is
   empty (nothing populated yet), fall through to step 2/3 and mention to me
   that `assets/bgm-library/README.md` explains how to add tracks.
2. **HeyGen retrieval** - only if I'm already signed in; their catalog is
   licensed for this use.
3. **MusicGen local generation** - last resort only. Its output is
   non-commercial-licensed - fine for drafts/internal review, but flag it to
   me explicitly before a final commercial deliverable ships with a
   MusicGen-generated track.

## Inputs I may give you
- A URL -> scrape it for copy, branding, screenshots.
- Files in `./videos/<product-name>/input/` (screenshots or a screen
  recording) -> extract keyframes with ffmpeg and use them as scenes.

## At the end of every run, print:
1. Path to output.mp4
2. Video duration + render time
3. One-line self-critique: weakest scene and how you'd improve it next run
4. Token usage: total input/output tokens and model(s) used (from
   `node scripts/log-usage.mjs <product-name>`, see Usage logging below)

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
