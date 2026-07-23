---
workflow: product-launch-video
flow: automation
storyboard: no
message: "Broad-spectrum SPF 50 protection safe for the whole family"
destination: website/general
aspect: 1920x1080
language: en
length: <=30s
angle: pain (unprotected sun exposure) -> solution (BSP broad-spectrum SPF 50 cream) -> proof (safe for adults and children) -> CTA (protect your family today)
---

## Intent

Punchy, ≤30s conversion spot for **BSP — Broad Spectrum Protection Cream SPF
50 for Adults and Children** by Christell Skin
(https://www.christellskin.com/product/broad-spectrum-protection-cream-spf-50-for-adults-and-children).
Physical product (a sunscreen cream), not software — no device/browser
mockups or UI recreation. UGC/testimonial style, not polished cinematic: a
real person's authentic, conversational recommendation rather than a
corporate SaaS launch. Autonomous run: fix lint/render errors and keep going
without stopping to ask, per this project's CLAUDE.md.

Structure: 0-3s hook (sun damage / lack of protection, no logo) -> 3-6s
product-name reveal + one-line promise -> 6-24s ONE product beat (SPF 50
broad-spectrum protection safe for adults and children) via animated product
photography with callouts on details/specs, not a full ingredient tour ->
24-30s CTA + URL + logo lockup ("Protect your family today" style).

## Assets

- Product photos and copy to be captured from the URL above in Step 1 (name,
  tagline, key benefits, brand colors/fonts, product photography).

## Customizations

- Physical-product override: clean studio/lifestyle background, slow Ken
  Burns zoom/pan + slow turntable-style rotation on product photos,
  GSAP-animated callouts pointing at details/specs (SPF 50, broad-spectrum,
  suitable for adults and children) instead of UI feature callouts.
- UGC style override: lighter, more handheld/authentic motion than the
  cinematic default — fewer Three.js/GSAP flourishes, simpler captions.
  Voice: casual/social Kokoro voice (e.g. `af_heart` or `af_sky`), varying
  `--speed` more aggressively line-to-line (0.95-1.15) for a natural, slightly
  uneven human cadence rather than a polished narrator.

## Notes

- Input source: URL only (no screenshots/recording supplied).
- Motion: GSAP for simple spring/ease transitions and staggered caption
  reveals; Ken Burns + turntable on product photos; subtle, understated
  background (not a heavy particle/gradient-mesh system, per UGC style).
- Audio: light BGM ~0.15-0.2 volume ducked under voice (check
  `assets/bgm-library` first, MusicGen fallback only); SFX per CLAUDE.md's
  cue table (whoosh on transitions, pop on callouts, chime on final
  CTA/logo).
- Quality pass: iterate at `--quality draft`; render `standard`/`high` once
  only, after draft frames look right; inspect 3-4 final frames.
