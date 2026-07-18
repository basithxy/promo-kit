---
workflow: product-launch-video
flow: automation
storyboard: no
message: "See what's actually working on Facebook — capture and rank any post in one click"
destination: website/general
aspect: 1920x1080
language: en
length: 45-90s
angle: pain (manual screenshotting/swipe-filing to track Facebook content) -> solution (auto-capture while scrolling) -> proof (dashboard + Discovery feed of top 1% posts) -> CTA (free tier / lifetime $139)
---

## Intent

Full product launch promo for **PostSnag** (https://postsnag.com) — corrected
from the working title "PhotoSnag" after Step 1 capture confirmed the site's
actual name/branding (user confirmed 2026-07-18: use the real name). PostSnag
is a Chrome extension for marketers/agencies/creators that auto-captures every
Facebook post as you scroll any profile/page/group, organizes captures into a
dashboard, ranks them by performance (likes/comments/shares/video plays), and
surfaces a community "Discovery" feed of the top 1% performing posts —
replacing manual screenshotting/swipe-filing.

Polished cinematic style (Apple/Linear/Vercel-quality), not UGC. Sell the
product (not a plain site tour) — full launch scope, not a single feature
announcement. Fuller 45-90s feature tour explicitly requested instead of the
default <=30s cut: hook -> reveal -> 3 features -> montage -> CTA. Autonomous
run: fix lint/render errors and keep going without stopping to ask, per this
project's CLAUDE.md.

The 3 feature beats (from Step 1 capture, `capture/extracted/visible-text.txt`
+ `asset-descriptions.md`):
1. Auto-capture — captures every post automatically while scrolling any
   profile, page, group (personal, business, or creator accounts).
2. Dashboard — bookmark, organize by Facebook Group, rank by what performs
   (likes/comments/shares/video plays), full analytics breakdown.
3. Discovery feed — see the top 1% performing posts across the whole
   PostSnag community, not just accounts you're tracking.

CTA: free tier (3 profile scans/week, 30 posts each) or Lifetime $139
one-time (unlimited tracking + full analytics + Discovery feed) — lead with
"start free," URL postsnag.com, logo lockup.

## Assets

- `capture/assets/` — 9 real images (landing hero, "every data point
  captured," "find the posts worth copying," how-it-works step 3, "stop
  guessing start saving," og-image, welcome-tutorial-thumb, favicon, logo
  SVG) + ~44 UI-icon SVGs + 19 font files, plus `capture/screenshots/` (15
  full-page scroll captures + 2 contact sheets). Recreate the dashboard/
  extension UI as animated HTML/CSS mockups per CLAUDE.md — don't paste these
  screenshots directly; use them as the visual reference.
- Brand tokens (`capture/extracted/tokens.json`): primary accent `#233987`
  (blue), neutrals `#FFFFFF`/`#0A0A0A`/`#171717`/`#404040`/`#F8FBFE`, dark
  section `#0A1535` with `#8D72FF` accent. Fonts: Geist (display/body),
  Geist Mono, Mona Sans.

## Notes

- Input source: URL only (no screenshots/recording supplied). Step 1 capture
  completed cleanly — no BLOCKED.md, all gate artifacts present.
- Motion: GSAP-driven throughout; Three.js/WebGL for depth/parallax; animated
  gradient-mesh or particle background; nothing static longer than ~1.5s.
- Voice: warm, confident, mid-energy narrator, neutral US accent; calm on
  hook, lifts through demo, warm on CTA.
- Audio: BGM ~0.15 volume ducked under voice; SFX per CLAUDE.md's cue table
  (whoosh on transitions, click on UI taps, pop on element entrances, chime
  on final CTA/logo).
- Quality pass: iterate at `--quality draft`; render `standard`/`high` once
  only, after draft frames look right; inspect 3-4 final frames.
