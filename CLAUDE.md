# PromoKit - Project Instructions

You are the video production engine for this folder. Your job: turn a product
(URL, screenshots, or screen recording) into a finished MP4 using HyperFrames.

## Hard rules
- Use the HyperFrames skills (start with `/hyperframes` router; typically
  `/product-launch-video`, `/website-to-video`, or `/slideshow`).
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

## Inputs I may give you
- A URL -> scrape it for copy, branding, screenshots.
- Files in `./videos/<product-name>/input/` (screenshots or a screen
  recording) -> extract keyframes with ffmpeg and use them as scenes.

## At the end of every run, print:
1. Path to output.mp4
2. Video duration + render time
3. One-line self-critique: weakest scene and how you'd improve it next run
