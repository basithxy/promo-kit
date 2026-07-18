---
format: 1920x1080
message: "Stop guessing what works on Facebook — snag any post, build your swipe file, and see it ranked automatically."
arc: PAS with feature-benefit progression (hook -> product intro -> 3 feature/benefit beats -> social-proof montage -> CTA)
audience: social media managers, growth marketers, content strategists, and small agencies who study competitor/creator Facebook content
mode: autonomous
music: uplifting confident modern tech underscore, energetic but not aggressive
---

## Video direction

- **Palette system** (from `frame.md`, blue-professional remix): warm cream `{colors.bg}` ground on every frame; a single saturated cobalt `{colors.primary}` (#233987) carries every accent — underlines, tag-pills, glows, bars, the CTA button, the cursor. Headlines stay near-black `{colors.text}`, never cobalt. No second accent color anywhere in the video. Tinted cards (4% cobalt fill / 20% cobalt border / 10-14px radius) — never a drop shadow.
- **Motion grammar + reveal model**: `power3` long-tail settle by default on every entrance — no bounce, no `back.out`/`elastic.out` overshoot (the consulting-grade restraint this brand calls for makes bounce especially wrong here). Every frame reveals piece-by-piece **on its spoken cue** — never dump the canvas in the first 25%; the back ~50% of each frame's duration carries at least one reveal. During any hold, the only sanctioned aliveness is a low-amplitude subtle jitter (`sine-wave-loop`) or a live SVG/icon internal — never lazy breathing, never a back-half camera pan/push.
- **Rhythm / held-frame allocation**: Frames 3-5 (the three feature beats) are the busiest — camera-chase and camera-reveal moves carry them. Frames 1, 2, and 7 are the deliberate breathers: Frame 1 is flat typography only (no camera), Frame 2 resolves to a settled brand lockup, Frame 7 is camera-static end to end (the click is the climax, not motion). Frame 6 is rapid but each of its 3 lines still gets a full still beat to be read, not a subliminal flash. This alternation (calm hook -> calm intro -> busy feature run -> rapid-but-legible proof -> calm click) is the energy arc the VOICE direction in SCRIPT.md also follows.
- **Negative list**: no lazy breathing; no slow pan/push in any frame's back half; no bouncy/overshoot entrances anywhere (this brand's restraint makes that doubly true); no drop shadows on content (frame.md's own rule); no invented metrics or testimonial numbers beyond what capture actually returned; no real Facebook chrome/nav/scrollbars reproduced verbatim (browser-window mockups only, no cursor except the intentional custom cobalt cursor in Frame 7); no third-party logos (Claude/ChatGPT/Meta) rendered as marks — name-only, text, per frame.md's "Approved Entities" rule; never both failure modes — slideshow (front-load-then-freeze) and screensaver (everything floating independently uncued).

## Frame 1 — Still guessing

- scene: Bare canvas, kinetic type only — no logo yet. The question lands cold.
- voiceover: "Still screenshotting every viral Facebook post? Still guessing what actually works?"
- duration: 4.757s
- transition_in: cut
- status: animated
- src: compositions/frames/01-hook.html
- type: hook
- persuasion: Pain validation
- beat: frustration -> curiosity
- blueprint: kinetic-type-beats (Reproduce — Hook escalation, two-beat statement build)
- asset_candidates:
- focal: (typography only)
- roles: n/a — no assets this frame
- sfx: whoosh-short

narrativeRole: Opens on the exact fatigue the audience already feels — manual screenshotting, no way to know what's actually working — in their own outcome language, no product or logo yet.
keyMessage: Tracking Facebook content by hand is broken.

Scene 1 (0.0-2.2s): cream ground; only the first spoken cue enters — "Still screenshotting / every viral post?" in bold near-black type (h1 role), **per-word staggered reveal** (`dynamic-content-sequencing`) landing on a smooth **power3** settle. Centered, ~45% of frame. A cobalt underline draws left-to-right under "screenshotting" as it lands (`css-marker-patterns`). Camera static.
Scene 2 (2.2-4.757s): as the VO reaches "Still guessing," the whole line **hard-cuts** (`discrete-text-sequence`) to beat 2 — "Still guessing / what actually works?" — arriving via a clean scale-in on power3, no overshoot. Resolves and **holds** to end; subtle jitter only, no further motion.

## Frame 2 — Introducing PostSnag

- scene: Product name and mark assemble from the dissolving question marks; one-line promise lands under it.
- voiceover: "Introducing PostSnag — snag any post, build your swipe file, finally see what works."
- duration: 5.077s
- transition_in: zoom-through
- status: animated
- src: compositions/frames/02-intro.html
- type: product_intro
- persuasion: Friction reduction
- beat: curiosity -> relief
- blueprint: kinetic-type-beats (Reproduce — Product_Intro "Introducing..." namedrop variant)
- asset_candidates: assets/logo-cf8f6ce7.svg — PostSnag brand mark
- focal: assets/logo-cf8f6ce7.svg
- roles: logo-cf8f6ce7.svg = cutout (brand mark, foreground)
- sfx: pop

narrativeRole: Lands the value claim (message) by beat 2, per story-spine's reverse iceberg — everything after this is evidence.
keyMessage: PostSnag turns Facebook scrolling into an organized, rankable swipe file.

Scene 1 (0.0-1.7s): cream ground; "Introducing" enters with a drawn cobalt underline (`css-marker-patterns`), then **hard-cuts** to the "PostSnag" wordmark in near-black (h1 role) as the VO names it. The brand mark (`assets/logo-cf8f6ce7.svg`) **spring-pop-entrance**s beside it on a smooth long-tail settle — no overshoot. Centered, ~50% of frame.
Scene 2 (1.7-3.6s): as the VO says "snag any post, build your swipe file," a tagline sub-line **assembles per-word** (`dynamic-content-sequencing`) beneath the held wordmark — the mark itself holds steady, no re-animation.
Scene 3 (3.6-5.077s): on "finally see what works," the tagline's last words swap **in-place** (`discrete-text-sequence`) to land on "what works"; a soft cobalt glow blooms behind the resolved lockup (`ambient-glow-bloom`). Holds to end; subtle jitter only.

## Frame 3 — Capture without the work

- scene: Browser window scrolling a real Facebook profile feed; posts light up and snap into a capture tray as the scroll passes them, cursor doing nothing extra.
- voiceover: "Scroll any profile, page, or Facebook group — just like normal. PostSnag captures every post the moment it appears. No saving one by one, ever again."
- duration: 9.643s
- transition_in: crossfade
- status: animated
- src: compositions/frames/03-auto-capture.html
- type: feature_showcase
- persuasion: Friction reduction
- beat: relief + ease
- blueprint: cursor-ui-demo (Adapt — Key_Feature real-workflow posture)
- asset_candidates: assets/Find_20the_20Best_20Posts_20on_20Any_20Facebook_20Profile.mp4 — [video] sort, capture, organize, analyze winning posts from any profile/group in 1 click
- focal: assets/Find_20the_20Best_20Posts_20on_20Any_20Facebook_20Profile.mp4
- roles: Find_20the_20Best_20Posts_20on_20Any_20Facebook_20Profile.mp4 = cutout (hero video surface, browser-window framed)
- sfx: whoosh-short, pop

narrativeRole: First proof beat — shows the product doing the exact tedious task the hook named, effortlessly.
keyMessage: Auto-capture removes the manual screenshotting entirely.

Adapt: keep cursor-ui-demo's camera-chases-the-interaction structure and live-UI-response signature move; change the "cursor" actor — the real captured scroll clip itself supplies the scrolling motion, and a reconstructed cobalt-tinted capture-tray (HTML/CSS mockup, not a pasted screenshot) is the element that reacts to it.
Scene 1 (0.0-3.3s): a floating browser-window mockup (macOS-style traffic lights, cobalt-tinted 1.5px border, no shadow, `3d-page-scroll` framing) drifts in from a slight tilt and settles centered-left, ~55% of frame. Inside it the real clip begins playing, showing a Facebook feed scrolling — the only thing on screen at t=0, matching the VO's opening line. Camera holds static.
Scene 2 (3.3-7.1s): as the VO says "PostSnag captures every post the moment it appears," a cobalt-tinted capture-tray panel slides in from the right edge (asymmetric 60/40, 3 depth layers). Tinted post-cards **spring-pop-entrance** into the tray one at a time in sync with the video's scroll, each landing on a smooth power3 settle with a soft cobalt tick-glow. Camera slow **push-in** toward the tray (`multi-phase-camera`).
Scene 3 (7.1-9.643s): on "No saving one by one, ever again," the tray's card stack holds full; camera eases to a static rest on the whole composition. A small cobalt checkmark badge **spring-pops** once beside the tray count as final punctuation. Settle-and-hold; subtle jitter only.

## Frame 4 — One dashboard, ranked automatically

- scene: Captured posts flow into a clean dashboard UI; cards sort themselves into a ranked list as filter chips (likes / comments / shares / video plays) get tapped.
- voiceover: "Every capture lands in one dashboard — bookmark it, organize by group, then rank by likes, comments, shares, even video plays, to surface the winners instantly."
- duration: 9.429s
- transition_in: push-slide LEFT
- status: animated
- src: compositions/frames/04-dashboard.html
- type: feature_showcase
- persuasion: Show-don't-tell proof
- beat: control + clarity
- blueprint: device-surface-showcase (Reproduce — floating-window variant, real clip as the window's screen content)
- asset_candidates: assets/Postsnag_20Dashboard_20Demo.mp4 — [video] send posts/profiles to dashboard, bookmark/sort/rank/analyze in one place
- focal: assets/Postsnag_20Dashboard_20Demo.mp4
- roles: Postsnag_20Dashboard_20Demo.mp4 = cutout (hero window surface)
- sfx: click, ping

narrativeRole: Second proof beat — the organizing/ranking payoff that makes captured posts actually useful.
keyMessage: The dashboard turns raw captures into a ranked, organized view.

Scene 1 (0.0-2.2s): the floating dashboard window (macOS chrome, cobalt-tinted, `3d-page-scroll` framing) dissolves in; the real dashboard-demo clip plays as the window's screen content, opening on its bookmark/save view as the VO opens "Every capture lands in one dashboard." Camera begins a slow **push-in** on the window (`multi-phase-camera`).
Scene 2 (2.2-5.4s): as the VO says "bookmark it, organize by group," a cobalt tag-pill row (Facebook-group filter chips) reveals along the top of the window via per-item staggered pop (`dynamic-content-sequencing`); the video content inside scrolls to the organize-by-group state (screen-cycling). Camera pans toward the filter row (`viewport-change`).
Scene 3 (5.4-8.3s): on "rank by likes, comments, shares, even video plays," a cobalt bar-ranking overlay (the `bar-track` component, 4 labeled cobalt-fill bars) springs up beside the window — one bar per named metric — each filling left-to-right on its spoken word (`stat-bars-and-fills`), landing in ranked order.
Scene 4 (8.3-9.429s): on "to surface the winners instantly," the top-ranked bar gets a soft cobalt glow bloom (`ambient-glow-bloom`); the whole composition settles; camera comes to rest; subtle jitter only.

## Frame 5 — Discovery does the rest

- scene: A feed of outlier posts assembles as glowing cards, camera pushing toward a "top 1%" badge on the standout post.
- voiceover: "And the Discovery feed does the rest — surfacing the top one percent, the viral outliers, across every profile you track."
- duration: 7.211s
- transition_in: push-slide LEFT
- status: animated
- src: compositions/frames/05-discovery.html
- type: feature_showcase
- persuasion: Statistical proof
- beat: intrigue -> confidence
- blueprint: grid-card-assemble (Adapt — Key_Feature glass-card-reveal variant; overrides Step-3's dataviz-countup candidate — the camera-driven unfold-from-icons shape fits a Key_Feature beat better than a Problem/Product_Intro data-hero shape)
- asset_candidates: assets/postsnag-how-it-works-step-3.mp4 — [video] sort and find the posts that perform best; assets/find-the-posts-worth-copying.webp — Discovery feed section image
- focal: (the reconstructed outlier-card grid; no single hero asset)
- roles: postsnag-how-it-works-step-3.mp4 = background (dimmed ~40%, texture only, never full-strength); find-the-posts-worth-copying.webp = supporting (thumbnail texture inside one grid tile)
- sfx: whoosh, ping

narrativeRole: Third proof beat — the passive, always-on payoff on top of the first two active features.
keyMessage: PostSnag surfaces what's working even outside the profiles you're actively watching.

Adapt: keep grid-card-assemble's camera-driven zoom-out-from-tight-icons signature move (icons shrink to card headers, center card spring-forwards); change the cards to outlier Facebook-post tiles instead of generic feature pills, and let the real how-it-works clip supply a dimmed background texture instead of a plain gradient.
Scene 1 (0.0-1.7s): camera opens TIGHT on 2 glowing cobalt mini-icons (a bookmark glyph + a trending-arrow glyph), centered, ~20% of frame — the only thing on screen as the VO says "And the Discovery feed does the rest." The how-it-works clip glimpses faintly behind them, dimmed ~40% (`depth-of-field-blur`), texture only.
Scene 2 (1.7-4.7s): as the VO names "surfacing the top one percent," the camera **zooms out** (`multi-phase-camera` pull-back phase) — the icons shrink into card headers as outlier post-cards grow out from behind them into a 2x3 grid (signature move). The center card scales ~105% forward and gets a cobalt "Top 1%" tag-pill badge (`spring-pop-entrance`) as it lands.
Scene 3 (4.7-7.211s): on "the viral outliers, across every profile you track," the remaining cards settle into the grid with a gentle low-amplitude parallax float (`sine-wave-loop`); a soft cobalt glow sweeps once across the row (`ambient-glow-bloom`). Holds to end; camera static.

## Frame 6 — What people are saying

- scene: Rapid-fire value/proof lines flash center-frame, staccato, each clearing before the next.
- voiceover: "A competitor's whole year, pulled in two minutes. No proxies, no fake accounts — just your own session. Export straight into Claude or ChatGPT."
- duration: 9.024s
- transition_in: zoom-through
- status: animated
- src: compositions/frames/06-proof-montage.html
- type: social_proof
- persuasion: Social proof
- beat: trust -> excitement
- blueprint: kinetic-type-beats (Adapt — Benefits rapid-fire montage, slowed for legibility)
- asset_candidates:
- focal: (typography only)
- roles: n/a — no assets this frame
- sfx: whoosh-short, chime

narrativeRole: Closes the evidence act with real outcomes and a risk-reversal point (no proxies/fake accounts = safe, ToS-friendly), before the CTA.
keyMessage: Real teams get real results, safely, in minutes not days.

Adapt: keep the hard-cut whole-line swap on a shared beat array with a settle-and-hold finale (signature move); change the cadence — only 3 real, capture-sourced lines at a slower ~3.3s/beat (not 8-12 sub-0.5s beats) so each is actually legible, each with a small cobalt "Real PostSnag user" attribution tag-pill; no bg-invert flips, to stay inside this brand's single-cobalt-accent restraint.
Scene 1 (0.0-3.0s): cream ground; "A competitor's whole year, pulled in two minutes." hard-cut FLASHES in (h2 role, `kinetic-beat-slam`), a small cobalt tag-pill "Real PostSnag user" fades in beneath.
Scene 2 (3.0-6.0s): **hard-cut** whole-line swap (`discrete-text-sequence`) to "No proxies, no fake accounts — just your own session." Same treatment; cream ground holds (no invert).
Scene 3 (6.0-9.024s): final hard-cut to "Export straight into Claude or ChatGPT." (names only — no third-party marks per the negative list). Lands and **settles**, no scale-out; subtle jitter only.

## Frame 7 — Add it to Chrome

- scene: The PostSnag mark condenses into the "Add to Chrome" button; URL and logo lockup hold on the final frame.
- voiceover: "Add PostSnag to Chrome — free, and sixty seconds to set up."
- duration: 4.117s
- transition_in: crossfade
- status: animated
- src: compositions/frames/07-cta.html
- type: cta
- persuasion: Risk reversal
- beat: motivation
- blueprint: cta-morph-press (Reproduce)
- asset_candidates: assets/logo-cf8f6ce7.svg — PostSnag brand mark
- focal: assets/logo-cf8f6ce7.svg
- roles: logo-cf8f6ce7.svg = cutout (the morphing hero mark)
- sfx: click, chime

narrativeRole: Final ask — a free, near-zero-friction action that pays off the whole reverse-iceberg promise.
keyMessage: Getting started costs nothing and takes a minute.

Scene 1 (0.0-1.0s): cream ground; the PostSnag brand lockup (mark + wordmark) holds dead-center, resting — faint rotational breath only (`sine-wave-loop`, low amplitude). Camera static.
Scene 2 (1.0-1.8s): as the VO says "Add PostSnag to Chrome," the lockup **condenses** at the same center into the cobalt `cta-button` pill reading "Add to Chrome — Free" (`scale-swap-transition`, shared transform-origin).
Scene 3 (1.8-2.8s): on "free, and sixty seconds," a small cobalt cursor arrives from off-stage on a decelerating path, landing just off the button's geometric center — a human-aimed approach.
Scene 4 (2.8-4.117s): on "to set up," the cursor presses — button and cursor compress together (`physics-press-reaction`), release with a soft cobalt glow ripple (`cursor-click-ripple` + `ambient-glow-bloom`). The `postsnag.com` URL settles beneath in the tag typography. Holds to end.
