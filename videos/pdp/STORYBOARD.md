---
format: 1920x1080
message: "Professional property marketing documents, generated in minutes — not days."
arc: PAS (pain -> agitation -> solution/product intro -> demo -> CTA)
audience: estate agents, property developers, and sales organisations who need on-brand marketing documents fast
music: uplifting corporate tech, bright modern piano with synth pads
---

## Video direction

- **Palette** (from `frame.md`, roles only — never invented): `bg` #FFFFFF canvas everywhere; `primary` #0565F5 cobalt is the ONLY accent (eyebrows, CTA, glow, progress); `text` #141414 near-black for headlines; `text-muted` #6B6B6B for body/secondary; `card-bg`/`border` (4%/20% cobalt tint) for any content card. No second accent color anywhere in the video.
- **Motion grammar** — `power3` long-tail settle everywhere (never bouncy/overshoot; the one sanctioned exception is the CTA's final press in Frame 6, still not a spring overshoot). Every frame's reveal is paced to its voiceover cue — nothing appears before the VO names it; entrance carries only what's spoken at t=0, remaining pieces reveal across the back ~50%.
- **Rhythm / held-frame allocation** — Frame 1 (hook) and Frame 6 (CTA final hold) are the video's two deliberate held/breather beats: content resolves early in the window and then holds still (subtle jitter at most), giving the two demo-continuation frames (4, 5) room to feel busier by comparison. Frames 3-5 (the demo) carry the video's motion energy — camera chases + live UI response — since that's the single strongest beat.
- **Color grade** — resolved via media-use, matching `frame.md`'s clean/confident/high-contrast blue-professional mood: `data-color-grading='{"preset":"deep-contrast","intensity":1}'`. Every frame worker applies this identical block to its focal image/video clip — no per-frame invented grades.
- **Negative list** — no off-brand hues (cobalt is the only accent; no purple/teal "AI" gradients); no lazy breathing (circular scale loops); no slow pan/push in a scene's back half; no nav bars / browser chrome / real cursor screenshots — the UI is a clean animated HTML/CSS mockup throughout, never a pasted screenshot; no slideshow front-loading (everything dumped by 25% then frozen) and no screensaver drift (elements floating independently with no VO tie).

## Frame 1 — Hook

- scene: Bold kinetic type states the pain, alone on a bare canvas — no logo yet
- voiceover: "Great property brochures shouldn't cost a fortune — or take all week."
- duration: 4.267s
- transition_in: cut
- status: animated
- src: compositions/frames/01-hook.html
- type: hook
- persuasion: Pain validation
- beat: frustration
- blueprint: kinetic-type-beats (Adapt — Problem variant, chunked across 3 short windows instead of one flash-line)
- focal: (typography only — no asset)
- roles: (none)
- sfx: whoosh
- asset_candidates:

Cold open on the pain every estate agent/developer/sales org already feels: marketing documents are expensive to commission and slow to turn around. No product, no logo — just the problem, stated plainly and fast.

Adapt: Problem variant's chunk-by-chunk reveal, but only 3 short windows (this hook is one line, not 3-5 pain statements) — keeps the signature "bare canvas, one chunk at a time, no product yet" move.

Scene 1 (0.0–1.4s): Solid white `[bg]` field, nothing else. "Great property brochures" hard-cut FLASHES in centered, `[text]` near-black, bold — Centered, ~35% of frame. Camera locked.
Scene 2 (1.4–2.8s): as the VO continues, "shouldn't cost a fortune —" replaces it via per-word staggered fade reveal (`kinetic-beat-slam`); a thin `[primary]` cobalt underline draws left→right beneath the word "fortune" (`css-marker-patterns`). Centered, camera locked.
Scene 3 (2.8–4.27s): final chunk "or take all week." hard-cuts in (`discrete-text-sequence`), settles on a `power3` long-tail (no bounce); holds static to the end.

## Frame 2 — Product reveal

- scene: "Introducing PropDesigner Pro" hard-cuts through tagline beats and resolves on the logo mark
- voiceover: "Introducing PropDesigner Pro — professional marketing documents, made in minutes."
- duration: 5.611s
- transition_in: zoom-through
- status: animated
- src: compositions/frames/02-product-intro.html
- type: product_intro
- persuasion: Negative contrast (pain -> named fix)
- beat: relief
- blueprint: kinetic-type-beats (Reproduce — Product_Intro namedrop variant)
- focal: assets/logo.png
- roles: logo.png = cutout (resolves centered at Scene 3, no background image this frame)
- sfx: chime
- asset_candidates: assets/logo.png — official PropDesigner Pro logo mark (blue building icon + wordmark)

The named solution lands immediately after the pain — section boundary, hence zoom-through. First appearance of the brand mark.

Reproduce: the namedrop pattern maps directly — "Introducing…" hard-cut, brand name, resolve on the logo mark.

Scene 1 (0.0–1.9s): white `[bg]`. "Introducing" flashes in bold centered with a `[primary]` cobalt selection-box drawing around it (`css-marker-patterns`) — Centered, camera locked.
Scene 2 (1.9–3.7s): hard-cuts to "PropDesigner Pro" in `[text]` near-black, `[primary]` cobalt accent-line (60×4) drawn above it (`discrete-text-sequence` whole-line swap) — Centered.
Scene 3 (3.7–5.61s): as the VO says "made in minutes," the resolved brand `logo.png` mark SPRING-POPS in just above the wordmark on a smooth `power3` settle (`spring-pop-entrance`, no overshoot), then holds static — Centered, ~40% of frame.

## Frame 3 — Demo: add your details

- scene: Cursor-led look at the app surface — property details form + brand-style picker
- voiceover: "Add your property details, pick a brand style —"
- duration: 2.859s
- transition_in: crossfade
- status: animated
- src: compositions/frames/03-demo-input.html
- type: feature_showcase
- persuasion: Show-don't-tell proof
- beat: curiosity
- blueprint: cursor-ui-demo (Reproduce — Key_Feature end-to-end variant)
- focal: assets/app-dashboard-screenshot.jpg
- roles: app-dashboard-screenshot.jpg = background (reference only, rebuilt as HTML/CSS mockup, not pasted) · estate-agents-screenshot.jpg = supporting (reference for form-field styling)
- sfx: key-press, click
- asset_candidates: assets/app-dashboard-screenshot.jpg — real app dashboard UI, reference for recreating the input surface; assets/estate-agents-screenshot.jpg — property-details entry UI reference

Step 1 of the single strongest demo beat (input -> generate -> result, shown as one continuous workflow across frames 3-5, not three separate features). Recreate as an animated HTML/CSS mockup per CLAUDE.md, not a pasted screenshot.

Reproduce: cursor-ui-demo's Key_Feature engine maps directly onto "fill a form, pick a style."

Scene 1 (0.0–1.4s): a clean app window (property-details form: address field, photo thumbnail, empty brand-style row) establishes centered over a soft white/cobalt-tint `[bg]` — asymmetric 60/30, 2 depth layers. Custom `[primary]`-colored cursor enters and TYPES into the address field character-by-character as the VO says "Add your property details" (`discrete-text-sequence` + `context-sensitive-cursor`); camera holds static.
Scene 2 (1.4–2.86s): camera push-in + pan (`viewport-change`) to a row of brand-style swatches lower in the form; as the VO says "pick a brand style —" the cursor clicks one swatch (`cursor-click-ripple`), it SELECTS with a `[primary]` cobalt ring (`asr-keyword-glow`) and the form's accent preview updates live to match; settles and holds on the selection — no third window, the line is too short for one.

## Frame 4 — Demo: AI generates the document

- scene: The interface processes — fields animate into a generating document, AI-at-work moment
- voiceover: "and let AI build the brochure, exposé, or fact sheet for you."
- duration: 4.16s
- transition_in: push-slide RIGHT
- status: animated
- src: compositions/frames/04-demo-generate.html
- type: feature_showcase
- persuasion: Show-don't-tell proof
- beat: intrigue
- blueprint: cursor-ui-demo (Reproduce — Key_Feature end-to-end variant, continuing Frame 3's workflow)
- focal: assets/fact-sheet-generation-screen.jpg
- roles: fact-sheet-generation-screen.jpg = background (reference for the generation-state layout) · sales-organisation-dashboard.gif = supporting (motion reference for the in-progress state)
- sfx: click, typing
- asset_candidates: assets/fact-sheet-generation-screen.jpg — real fact-sheet generation screen UI, primary reference for this beat; assets/sales-organisation-dashboard.gif — motion reference for an in-progress generation state

Step 2: the product actually doing the work — the single strongest value-prop (AI + smart automation replacing manual design). This is the beat that sells it; do not add a second, unrelated feature here.

Reproduce: same surface, same cursor, workflow continues — Scene 1 picks up exactly where Frame 3 Scene 3 ended.

Scene 1 (0.0–1.0s): cursor moves to a "Generate" button beside the selected swatch and PRESSES it — cursor + button compress together in lockstep, then release with a `[primary]` cobalt glow bloom (`physics-press-reaction`) as the VO opens "and let AI build the".
Scene 2 (1.0–2.8s): the form cross-fades to a document-type row of three tabs — Brochure / Exposé / Fact Sheet. As the VO names each one in turn ("brochure, exposé, or fact sheet"), that tab steps active (`[primary]` fill) one at a time, left to right (`discrete-text-sequence` state-stepping) — no all-at-once highlight.
Scene 3 (2.8–4.16s): as the VO says "for you," a thin progress bar beneath the tabs fills to 100% (`stat-bars-and-fills`) and the document preview area begins to assemble — layout blocks (header, photo, text columns) snap in from a clustered center point (`center-outward-expansion`) — camera settles static, holds on the near-complete assembly.

## Frame 5 — Demo: the result

- scene: A polished, on-brand property brochure/exposé lands on screen, fully designed
- voiceover: "A polished, on-brand document — ready in minutes, not days."
- duration: 4.096s
- transition_in: push-slide RIGHT
- status: animated
- src: compositions/frames/05-demo-result.html
- type: benefit_highlight
- persuasion: Feature-to-benefit translation
- beat: satisfaction
- blueprint: device-surface-showcase (Reproduce — static-tour variant)
- focal: assets/maple-valley-heights-preview.jpg
- roles: maple-valley-heights-preview.jpg = cutout (the hero finished document) · willow-west-preview.jpg = supporting (second example, glimpsed at the edge)
- sfx: pop
- asset_candidates: assets/maple-valley-heights-preview.jpg — example generated property brochure output; assets/willow-west-preview.jpg — second example generated property brochure output

Step 3: payoff of the demo — the generated document itself, proving the promise made in Frame 2. Closes the single demo beat.

Reproduce: static-tour's "no camera move, all motion is element-level" reading fits a payoff hold better than a moving camera — the demo's motion budget was already spent in Frames 3-4.

Scene 1 (0.0–1.4s): the finished `maple-valley-heights-preview` brochure page SLIDES IN from the right edge and settles (ease-out) into a soft device-style frame, centered-right; a faint `[primary]` cobalt accent shape scales up behind it (spring, `spring-pop-entrance`) as the VO says "A polished, on-brand document —". `willow-west-preview` peeks in, partially visible, stacked just behind/left of it — asymmetric 70/30, 2 depth layers. Camera static.
Scene 2 (1.4–2.7s): as the VO says "ready in minutes," a small `[primary]`-filled "Ready in 3 min" chip pops in at the document's corner (`spring-pop-entrance`) — no camera move, element-level only.
Scene 3 (2.7–4.1s): as the VO lands "not days," everything settles — no further motion beyond `sine-wave-loop` subtle jitter on the chip; holds static to the end.

## Frame 6 — CTA

- scene: Brand mark condenses into the CTA button; URL and logo lock up
- voiceover: "Try PropDesigner Pro free — at propdesigner-pro.com."
- duration: 4.224s
- transition_in: zoom-through
- status: animated
- src: compositions/frames/06-cta.html
- type: cta
- persuasion: Risk reversal (free, no cost barrier)
- beat: motivation
- blueprint: cta-morph-press (Reproduce)
- focal: assets/logo.png
- roles: logo.png = cutout (the hero mark that condenses into the CTA)
- sfx: click, chime
- asset_candidates: assets/logo.png — official PropDesigner Pro logo mark

Closing section boundary (zoom-through). Free trial removes friction; URL is the one action. Matches the site's own CTA copy ("Try Now For Free").

Reproduce: the morph-and-press engine maps directly onto "brand -> one free-trial click."

Scene 1 (0.0–1.0s): the `logo.png` lockup holds dead-center, alive but resting — only a faint rotational breath (`sine-wave-loop`, low amplitude); VO opens "Try PropDesigner Pro free —". Camera static.
Scene 2 (1.0–1.7s): the logo CONDENSES at the same screen center into a smaller, brighter `[primary]` cobalt "Try Now For Free" pill button — outgoing mark shrink-fades exactly as the CTA scales up in its place, sharing one `transform-origin` (`scale-swap-transition`).
Scene 3 (1.7–2.5s): as the VO says "at propdesigner-pro.com," a `[text-muted]` cursor arrives from off-stage on a decelerating path, landing a few px off the button's geometric center (`gsap-effects`, `power2.out`) — reads human, not scripted.
Scene 4 (2.5–4.22s): the cursor lands a physical click — cursor and CTA compress together in lockstep, then release with a soft `[primary]` glow bloom (`physics-press-reaction` + `ambient-glow-bloom`); the URL "propdesigner-pro.com" fades in beneath the button on the same beat. Holds on the clicked state to the end — this is the video's real exit (final frame).
