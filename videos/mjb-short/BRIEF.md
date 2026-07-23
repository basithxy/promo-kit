---
workflow: product-launch-video
flow: automation
storyboard: no
message: "Jobba turns your LinkedIn into a tailored resume and cover letter for every job in seconds"
destination: general
aspect: 1920x1080
language: en
length: 30s
---

## Intent

Full product launch promo for mjb-short (https://myjobbucket.com), a SaaS
product. Polished cinematic style (Apple/Linear/Vercel-quality), GSAP +
Three.js motion. Short & punchy: ≤30s conversion spot, not a brand film -
hook (pain point) -> product reveal -> ONE sharp demo/value-prop beat -> CTA.

## Assets

- Source: https://myjobbucket.com - scrape for name, tagline, key features,
  screenshots, brand colors/fonts. Recreate key UI as animated mockups, do
  not paste raw screenshots.

## Customizations

- Voice: warm, confident, mid-energy narrator; calm on hook, lifts through
  demo, warm on CTA. Script budget ~70-75 words for 30s.
- Audio: upbeat modern BGM at ~0.15 volume; tasteful SFX (whoosh on
  transitions, click on UI taps, pop on element entrance, chime on CTA).
- No burned-in captions/subtitles (per project CLAUDE.md default) unless
  explicitly requested later.

## Notes

- Fully autonomous run per project CLAUDE.md - fix lint/render errors and
  keep going without stopping to ask, unless truly blocked after 3 distinct
  fix attempts.
- Iterate at --quality draft; render standard/high exactly once at the end.
- Output must be copied to ./videos/mjb-short/output.mp4 as an explicit step
  after renders/video.mp4 is produced.
