---
format: 1920x1080
duration: 21s
message: "Jobba turns your LinkedIn into a tailored resume and cover letter for every job in seconds"
arc: Hook (pain) -> Product intro (promise) -> Key feature demo -> Benefit proof -> CTA
audience: Gen Z job seekers exhausted by tailoring resumes and tracking applications by hand
mode: autonomous
music: confident upbeat modern tech underscore
---

## Video direction

- **Palette** (from `frame.md`): near-black canvas `#08060f`; single accent purple `#7C2EFF` carries every eyebrow/numeral/CTA/progress moment; `#E934BD` pink is the secondary gradient partner used only where the brand's own hero gradient shows (the wordmark, the CTA glow) — never a second free-standing accent. Text white on dark; muted copy in `#99A1AF`. Cards: 4% purple fill, 20% purple border, no shadow, 10-14px radius. Pill chrome (100px) for the CTA.
- **Motion grammar**: `power3` long-tail settle everywhere; the only overshoot is the sanctioned `spring-pop-entrance` on card/stat/wordmark arrivals. Every frame's reveals are paced to its voiceover cue — nothing appears before the VO says it, and each frame's back ~50% carries the majority of its reveals. No lazy breathing, no back-half pan/push; a settled frame gets subtle jitter at most.
- **Rhythm**: Frames 1 and 5 are fast, punchy, mostly-static beats (typography swap, morph+press). Frames 3-4 are the video's development section — content builds progressively across their real ~4.9s and ~5.8s runtimes (durations below are synced to the recorded voiceover, not the original estimate). Deliberate holds: the end of Frame 2 (wordmark+promise settle before the demo) and the end of Frame 5 (clicked CTA holds to black).
- **Negative list**: no bouncy/elastic entrances as a default; no floating "AI gradient blob" cliches; no real browser chrome/scrollbars/nav bars; no cursor except the single human-aimed click in Frame 5; no slideshow (front-load-then-freeze) and no screensaver (independently-floating elements) failure modes.

## Frame 1 — The grind

- scene: Bare dark canvas, kinetic type punches in pain statements one at a time, no logo
- voiceover: "Another resume. Another cover letter. Another rejection."
- duration: 3.456s
- transition_in: cut
- status: animated
- src: compositions/frames/01-the-grind.html
- type: hook
- persuasion: Pain agitation
- beat: frustration
- blueprint: kinetic-type-beats (Reproduce — Problem variant, `problem-kinetic-type-beats`)
- focal: none — pure typography beat
- roles: none
- sfx: none
- asset_candidates: none — pure typography beat

Reproduce: three short pain statements, each landing alone on the bare canvas before the next hard-cuts it away — the exact `problem-kinetic-type-beats` shape.

Scene 1 (0.0–1.15s): solid near-black `#08060f` field, camera locked. "Another resume." hard-cut FLASHES in bold white, dead-center — Centered template, ~40% of frame, no fade/slide (`discrete-text-sequence`).
Scene 2 (1.15–2.3s): as the VO names it, "Another cover letter." hard-cuts in replacing the prior line in place — same treatment, nothing lingers (`discrete-text-sequence`).
Scene 3 (2.3–3.456s): "Another rejection." hard-cuts in on the VO's final beat, this one tinted toward `{colors.negative}` at low saturation on the key word only; holds static to the cut — no further motion, no jitter (the frame is too short to need it).

narrativeRole: Opens on the viewer's own exhausted job-search loop in their own outcome language, no product yet.
keyMessage: Job hunting the old way is a grind of repetition and rejection.

## Frame 2 — Meet Jobba

- scene: Brand name-drop resolves out of the pain beat; one-line promise lands under the wordmark
- voiceover: "Meet Jobba — upload your LinkedIn, it does the rest."
- duration: 3.179s
- transition_in: zoom-through
- status: animated
- src: compositions/frames/02-meet-jobba.html
- type: product_intro
- persuasion: Negative contrast
- beat: relief
- blueprint: kinetic-type-beats (Reproduce — Product_Intro variant, `product-intro-kinetic-type-namedrop`)
- focal: none — the wordmark is built as typography (see correction below)
- roles: logo-69859b93.svg = supporting, decorative only (verified: this is actually a "Find us on Product Hunt" trust badge, NOT the Jobba brand mark — the site has no captured logo image, its header uses styled text; may appear small/muted as a trust accent, never as the hero wordmark)
- sfx: pop, chime
- asset_candidates: assets/logo-69859b93.svg — Product Hunt trust badge, mislabeled by capture as a brand mark

Reproduce: hard-cut through the name-drop and resolve on the brand mark, then a one-line promise types in beneath it — the namedrop shape extended with the promise as its second beat.

Scene 1 (0.0–1.27s): out of Frame 1's dark hold, "Meet" fades up small and centered above where the mark will land; a beat later the **Jobba** wordmark spring-pops to full size dead-center with a purple-to-pink gradient sweep across the letterforms that settles to solid purple (`spring-pop-entrance` + `gradient-text-sweep`) — Centered template, ~45% of frame.
Scene 2 (1.27–3.179s): as the VO says "upload your LinkedIn, it does the rest," a muted one-line promise types on beneath the wordmark, per-word staggered reveal timed to each phrase (`dynamic-content-sequencing`); once complete, both wordmark and line hold rock-still — a deliberate breather before the demo begins (no jitter, no drift).

narrativeRole: Lands the value claim (message) by beat 2, right after the pain — the reverse-iceberg turn.
keyMessage: One upload, Jobba handles everything downstream.

## Frame 3 — Paste and match

- scene: A job description gets pasted into Jobba's tracker input; the app scans it and starts building a tailored resume live
- voiceover: "Paste any job post — Jobba writes your resume and cover letter to match, in seconds."
- duration: 4.907s
- transition_in: crossfade
- status: animated
- src: compositions/frames/03-paste-and-match.html
- type: feature_showcase
- persuasion: Show-don't-tell proof
- beat: intrigue
- blueprint: prompt-type-submit-generate (Adapt — Key_Feature, sub-shape B full-generate-loop)
- focal: assets/save-job-description-to-my-job-bucket.jpg
- roles: save-job-description-to-my-job-bucket.jpg = supporting (layout/UI reference only) · create-save-and-switch-resumes-instantly.jpg = supporting (layout/UI reference only) · personalized-cover-letters-in-seconds.jpg = supporting (layout/UI reference only)
- sfx: typing, click, pop
- asset_candidates: assets/save-job-description-to-my-job-bucket.jpg — job-description-to-tracker UI reference; assets/create-save-and-switch-resumes-instantly.jpg — tailored resume UI reference; assets/personalized-cover-letters-in-seconds.jpg — cover letter UI reference

Adapt: keep the type→submit→status-theater→streaming-answer signature; the "answer" is TWO documents (resume, then cover letter) instead of one text stream, so the back half runs two staggered build-outs instead of one. Recreate the tracker/resume/cover-letter surfaces as clean animated HTML/CSS mockups per `frame.md`'s card system — the referenced screenshots are layout guides only, never pasted in.

Scene 1 (0.0–0.7s): a reconstructed Jobba tracker window (dark card, purple hairline border, pill nav) settles into frame via one eased push-in that lands tight on its paste-input field — Centered template, ~55% of frame (`multi-phase-camera` + `coordinate-target-zoom`).
Scene 2 (0.7–2.1s): as the VO says "Paste any job post," a job-description block types in fast character-by-character behind a blinking caret and the input card fills to hold it; camera holds its lock on the input (`discrete-text-sequence`).
Scene 3 (2.1–2.5s): the cursor lands the submit click; the input collapses to a slim status header reading "Matching your profile…" with a left-to-right shimmer sweep (`discrete-text-sequence` + `ambient-glow-bloom`).
Scene 4 (2.5–4.3s): as the VO names "Jobba writes your resume and cover letter to match," a resume preview card spring-pops in on the left with its lines filling in, then a cover-letter preview card spring-pops in beside it the same way — two-up, asymmetric 55/45, each a supporting depth layer (`spring-pop-entrance`).
Scene 5 (4.3–4.907s): on "in seconds," both completed cards hold side-by-side; a soft purple glow blooms behind them and the frame settles still — subtle jitter at most (`ambient-glow-bloom`).

narrativeRole: The single sharpest demo beat — proof the promise is real, shown live on the product's own core loop.
keyMessage: Tailoring a resume and cover letter is now a paste, not a rewrite.

## Frame 4 — Track it all

- scene: The generated resume and cover letter drop into a clean applications tracker dashboard; stat callouts count up beside it
- voiceover: "Track every application in one place — apply 90% faster, land 3x more interviews."
- duration: 5.845s
- transition_in: crossfade
- status: animated
- src: compositions/frames/04-track-it-all.html
- type: benefit_highlight
- persuasion: Statistical proof
- beat: confidence
- blueprint: grid-card-assemble (Adapt — Benefits, `live-data-populate-board` variant)
- focal: assets/create-your-job-tracker.jpg
- roles: create-your-job-tracker.jpg = supporting (layout/UI reference only)
- sfx: pop, ping
- asset_candidates: assets/create-your-job-tracker.jpg — applications tracker dashboard UI reference

Adapt: keep the live-populate signature (cards spring in tethered to the board, then the board keeps updating after assembly) but the "post-assembly live update" is two stat pills counting up rather than status-pill flips. Recreate the tracker as a clean animated HTML/CSS dashboard per `frame.md`, not a pasted screenshot.

Scene 1 (0.0–0.6s): camera settles wide on an empty tracker board — dark card, purple header reading "Applications" — established and static, asymmetric 60/40 with room reserved upper-right for the stats to come.
Scene 2 (0.6–2.9s): as the VO says "Track every application in one place," application row-cards (company, role, status pill) spring in one-by-one into the list, staggered cascade, each landing with a short slide-into-slot (`spring-pop-entrance` + `center-outward-expansion`).
Scene 3 (2.9–4.35s): on "apply 90% faster," a stat pill materializes upper-right and its number counts up 0→90% with the pill's scale growing with the value (`counting-dynamic-scale`).
Scene 4 (4.35–5.845s): on "land 3x more interviews," a second stat pill counts up beside the first the same way; the board holds fully populated with both stats settled, a soft purple glow bloom behind the stat row, subtle jitter at most (`ambient-glow-bloom`).

narrativeRole: Cashes in the demo with the numbers that make the value claim credible.
keyMessage: Jobba doesn't just draft documents — it keeps the whole search organized and measurably faster.

## Frame 5 — One click away

- scene: Everything clears to a centered logo lockup with the CTA button and URL
- voiceover: "Your next job is one click away. Try Jobba free."
- duration: 3.179s
- transition_in: crossfade
- status: animated
- src: compositions/frames/05-one-click-away.html
- type: cta
- persuasion: Risk reversal
- beat: motivation
- blueprint: cta-morph-press (Reproduce — CTA)
- focal: none — the wordmark is built as typography (see correction below)
- roles: none (do NOT use logo-69859b93.svg here — verified it is a "Find us on Product Hunt" trust badge, not the Jobba brand mark; the site has no captured logo image, condensing a third-party badge into the CTA would be off-brand and confusing)
- sfx: click, chime
- asset_candidates: none — build "Jobba" as typography (bold wordmark in the frame's display type), same treatment as Frame 2

Reproduce: hero mark holds, condenses into the CTA, a cursor arrives and presses it — the blueprint's shape unchanged, cast with the Jobba wordmark and a "Try Jobba Free" pill.

Scene 1 (0.0–0.7s): the Jobba wordmark holds dead-center on the near-black canvas, alive but resting — only a faint rotational breath — as the VO says "Your next job is one click away." Camera static.
Scene 2 (0.7–1.3s): the wordmark CONDENSES at the same center into a smaller, brighter purple "Try Jobba Free" pill button — outgoing mark shrink-fades exactly as the pill scales up in its place, one shared transform-origin (`scale-swap-transition`).
Scene 3 (1.3–1.9s): a simple custom cursor arrives from off-stage on a decelerating path and lands a few px off the pill's geometric center, reading human, not scripted.
Scene 4 (1.9–3.179s): as the VO lands "Try Jobba free," the cursor presses — cursor and pill compress together in lockstep, then release with a soft purple glow bloom (`physics-press-reaction` + `ambient-glow-bloom`); the URL myjobbucket.com settles beneath the pill; holds dead static to the final frame.

narrativeRole: Closes on the free, low-friction action — no reason left not to click.
keyMessage: Getting started costs nothing and takes one click.
