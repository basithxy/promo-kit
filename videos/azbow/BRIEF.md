---
workflow: product-launch-video
flow: automation
storyboard: no
message: "azbow, shown live — the strongest thing about the site, in one sharp beat"
destination: general
aspect: 1920x1080
language: en
length: 30s
angle: showcase
---

## Intent

An informational/company website tour for azbow (https://www.azbow.com) -
a showcase of the site itself, not a hard sales pitch. Confirmed via a
`/video-agent` intake interview: informational/company website, polished
cinematic style (the route's default for this category), short & punchy
(<=30s, the default), input source is the URL alone.

Structure: 0-3s hook (no logo yet) -> 3-6s name reveal + one-line promise ->
6-24s ONE sharp showcase beat, the single strongest thing about the site,
shown live (not a multi-section tour) -> 24-30s CTA + URL + logo lockup.
Recreate key UI/site sections as animated HTML/CSS mockups, not pasted
screenshots. Rich motion throughout (GSAP + Three.js/WebGL depth, animated
gradient-mesh/particle background, nothing static longer than ~1.5s).

Voice: warm, confident, mid-energy narrator, neutral US accent, energy arc
calm -> lifts through the demo -> warm on the CTA. ~70-75 words of script for
30s. Music: upbeat modern BGM at ~0.15, ducked under voice. SFX: soft whoosh
on transitions, gentle click on UI taps, light pop on element entrances, soft
chime on the final CTA/logo (see CLAUDE.md's cue-mapping table for the full
19-sound library).

Voice/BGM: 100% local (Kokoro TTS + MusicGen/assets/bgm-library) per this
project's CLAUDE.md - never HeyGen/ElevenLabs, no auth-status preflight for
BGM/TTS.

## Notes

- Fully autonomous run: fix lint/render errors and keep going; only stop if
  truly blocked after 3 distinct fix attempts.
- Iterate at `--quality draft`; render `standard`/`high` exactly once, after
  draft frames look right.
- Wrap any directly-run capture/render command with `scripts/keep-awake.ps1`,
  logging to `renders/render_time.json` / `capture_time.json`.
- Checkpoint `./progress.json` after each phase.
