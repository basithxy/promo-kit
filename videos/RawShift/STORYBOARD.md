---
format: 1920x1080
message: "Convert, compress, split, and merge any file — entirely in your browser. No uploads, no cloud."
arc: Feature-Benefit Cascade (hook -> product intro -> breadth -> workflow -> privacy benefit -> value montage -> CTA)
audience: developers, designers, and privacy-conscious professionals who convert/compress files often
---

## Video direction

- **Palette (from `frame.md`):** ground `{colors.bg}` #FFFFFF on UI/device frames; the hook and montage frames run inverted — near-black `#0B0B12`-class ground with near-white type — for contrast and pacing variety. `{colors.primary}` #4F46E5 indigo is the ONLY accent everywhere: wordmark "Shift", tag pills, CTA, underlines, glows, checkmarks. Headlines near-black `{colors.text}` #111827 (never indigo); body/secondary `{colors.text-muted}`. No second accent color, ever.
- **Type:** display/headline role uses `frame.md`'s `h1`/`h2` ramp (brand font, near-black, −0.02em); eyebrow/chrome uses the uppercase 0.08em indigo `h4-eyebrow` role; body copy uses the muted `body` role. Reference by role only, per `frame.md`.
- **Persistent ambient layer:** every frame shares ONE continuous Three.js/WebGL background layer — a slow-drifting indigo gradient-mesh / soft particle field, low contrast, sitting behind all foreground content. It is finite and deterministic (driven off the timeline's seek time, never `Date.now`/`Math.random`); on light (white) frames it is barely-there (a few % opacity mesh in the corners so it never fights the UI mockups); on the dark hook/montage frames it is more present. This is the connective tissue that makes seven frames read as one continuous film, and it is what keeps nothing on screen "flat" for more than ~1.5s even during a held read.
- **Motion grammar:** long-tail decel only — `power3` (or `expo.out` on a fast arrival) — never `back.out`/`bounce.out`/`elastic.out`. Reveal each piece of a frame ON its spoken cue, sequenced across the back ~50% of the shot; never dump the whole canvas in the first ~25%. Every frame ends on a held read: content resolves, then holds — the only permitted aliveness during a hold is subtle jitter (`sine-wave-loop`, low amplitude) or the persistent ambient background layer itself. No lazy breathing, no back-half camera pan/push.
- **Rhythm / held-frame allocation:** Frames 1 and 7 are the two deliberate "breather" holds (short, high-impact, mostly static after their one move lands). Frames 3–5 are development frames — busiest in their back halves as the UI mockups build. Frame 6 is the one frame that is motion-as-rhythm throughout (rapid-fire cuts on the music beat) rather than a single held read.
- **UI mockups:** every product surface (browser-chrome device frame, tab bar, dropzone, action chips, comparison cards) is built as real HTML/CSS using `frame.md`'s tokens (tinted cards, pill chrome, soft indigo borders, no shadow save the CTA hover) — never a pasted screenshot. A single custom indigo cursor is the recurring "actor" across Frames 4 and 7.
- **Negative list:** no off-brand colors (indigo is the only accent — no purple/blue "AI" gradients beyond the one house gradient-mesh), no drop shadows on content cards, no square corners outside the progress-bar/chrome rules, no browser scrollbars/nav chrome beyond the intentional device-frame reconstruction, no slideshow (front-load-then-freeze), no screensaver (elements floating independently with no shared motion grammar), nothing static longer than ~1.5s.
- **Caption band:** bottom ~17% reserved on every frame; all of the above stays in the top ~83%.

## Frame 1 — Hook

- scene: Bare near-black canvas, big kinetic type flashes in, no logo yet
- voiceover: "Still uploading your files just to convert them?"
- duration: 2.944s
- transition_in: cut
- status: animated
- src: compositions/frames/01-hook.html
- type: hook
- persuasion: Pain validation
- beat: skepticism
- blueprint: kinetic-type-beats (Reproduce — Hook flash variant)
- focal: constructed kinetic-type shot — no captured asset; pure typography per CLAUDE.md's animated-mockup rule
- asset_candidates:

Open cold on the friction everyone already feels: converting a file usually means handing it to someone else's server first. No branding yet — just the question, landing hard on a near-black canvas. This frame is a deliberate breather/hold beat: one move, then stillness.

Scene 1 (0.0–1.4s): solid near-black ground (persistent gradient-mesh layer barely visible, low opacity). Bold near-white type flashes dead-center via hard-cut FLASH-in (no fade/slide): "Still uploading your files" — Centered, ~45% of frame, one depth layer over the ambient background.
Scene 2 (1.4–2.944s): as the VO completes the thought, "just to convert them?" continues the same line via per-word staggered reveal (`dynamic-content-sequencing`); a thin indigo underline draws left→right (`css-marker-patterns`, `svg-path-draw`) beneath "convert them" as the VO lands on it. Line holds, settles — subtle jitter only (`sine-wave-loop`, low amplitude) to the frame's end.

## Frame 2 — Meet RawShift

- scene: Cinematic wordmark assembly ("Raw" + "Shift" in gradient indigo) over the slow-drifting gradient-mesh field, one-line promise types in beneath
- voiceover: "Introducing RawShift — convert, compress, split, and merge, entirely in your browser."
- duration: 5.717s
- transition_in: zoom-through
- status: animated
- src: compositions/frames/02-product-intro.html
- type: product_intro
- persuasion: Negative contrast
- beat: relief + curiosity
- blueprint: kinetic-type-beats (Adapt — Product_Intro namedrop variant)
- focal: constructed wordmark + tag-pill row — no captured asset
- asset_candidates:
- sfx: whoosh

Section boundary: hook resolves into the brand. Adapt: keep the signature "resolve-on-brand-name" pop from the namedrop variant; add the persistent Three.js ambient layer (established in Frame 1) now driving more visibly behind the wordmark, and close on a value-pill row instead of a single tagline — a fresher surface while keeping the core beat (Introducing → name → promise).

Scene 1 (0.0–1.2s): ground crossfades from near-black to `{colors.bg}` white via the `zoom-through` harness transition. Small uppercase eyebrow "Introducing" (indigo, 0.08em tracking) flashes in upper-center with a drawn underline accent — Centered, ~20% of frame. Ambient gradient-mesh layer visible drifting behind, low opacity.
Scene 2 (1.2–2.6s): on "RawShift", the wordmark builds letter-by-letter dead-center — "Raw" in near-black, "Shift" filling with the indigo brand gradient — via spring-pop entrance on a smooth long-tail settle (`spring-pop-entrance`, `power3`, no overshoot) — Centered, ~55% of frame, 2 depth layers (wordmark foreground, ambient background).
Scene 3 (2.6–4.6s): as the VO names "convert, compress, split, and merge", four small indigo tag-pills (`tag-pill` component) stagger in beneath the wordmark left→right, one per named word (`center-outward-expansion`, item stagger-assemble) — asymmetric row, top ~83% safe.
Scene 4 (4.6–5.717s): "entirely in your browser" types in as one settled line beneath the pill row (`discrete-text-sequence`, per-word staggered reveal). Wordmark + pills hold static; only the ambient layer keeps its slow deterministic drift — settle, subtle jitter only.

## Frame 3 — Every format, one toolkit

- scene: Browser-chrome device frame holds the real tab bar (Images / Video / Audio / PDF / Docs); each tab self-assembles as the voiceover names it
- voiceover: "Images, video, audio, PDFs, and documents — RawShift covers all of it. Just pick a tab, and the right tools are already waiting for you."
- duration: 9.963s
- transition_in: crossfade
- status: animated
- src: compositions/frames/03-feature-breadth.html
- type: feature_showcase
- persuasion: Value stacking
- beat: curiosity -> clarity
- blueprint: grid-card-assemble (Reproduce — Key_Feature grid variant)
- focal: constructed browser-chrome device frame + tab bar (site's real copy: Images/Video/Audio/PDF/Docs) — no captured asset, an animated HTML/CSS mockup per CLAUDE.md
- asset_candidates:
- sfx: whoosh, pop

First feature beat: breadth. A clean browser-chrome device frame (recreated in CSS, not a screenshot) holds the real tab-bar copy from the site; each tab staggers in on the word that names it — the tile/pill grid-assemble shape reproduced as a horizontal tab row instead of a grid, since that is this product's real surface.

Scene 1 (0.0–1.0s): white `{colors.bg}` device frame (rounded window chrome, faint traffic-light dots, an address bar reading "raw-shift.vercel.app") scales+fades into center; an empty tab-bar region is established beneath it — Centered, ~55% of frame, 3 depth layers (ambient bg, device frame, tab-bar slot).
Scene 2 (1.0–4.3s): as the VO names each format, its tab pops into the bar in the site's real order — "Images" (1.0–1.9s) → "Video" (1.9–2.6s) → "Audio" (2.6–3.3s) → "PDF" (3.3–4.0s) → "Docs" (4.0–4.3s) — each via item stagger-assemble, short slide+fade directly into its slot (`center-outward-expansion`).
Scene 3 (4.3–7.0s): on "RawShift covers all of it", a slow camera push-in (`multi-phase-camera`) tightens on the completed tab bar as a thin indigo accent-line draws beneath it (`svg-path-draw`); a single traveling-glow sweep crosses the bar left→right (`ambient-glow-bloom`).
Scene 4 (7.0–9.963s): on "Just pick a tab, and the right tools are already waiting for you", the "Images" tab (matching the real site's default-active state) gets a soft indigo ring highlight and the real dropzone copy fades in beneath ("Drop images here or click to browse") — settles, holds; only the ambient layer keeps drifting; subtle jitter on the device frame only.

## Frame 4 — Drop, pick, done

- scene: Inside the same device frame, the custom cursor drags a file into the dropzone, then a row of action chips (Convert / Compress / Split / Merge) stagers in and one gets clicked
- voiceover: "Drop your files right into the browser, then pick an action — convert, compress, split, or merge. No menus to dig through, no settings to configure."
- duration: 9.856s
- transition_in: push-slide LEFT
- status: animated
- src: compositions/frames/04-feature-workflow.html
- type: feature_showcase
- persuasion: Show-don't-tell proof
- beat: control + ease
- blueprint: cursor-ui-demo (Reproduce — Key_Feature variant)
- focal: constructed dropzone + action-chip row inside the carried-over device frame — no captured asset
- asset_candidates:
- sfx: click, whoosh

Second feature beat: the actual workflow, end to end — drag file in, dropzone reacts, choose the action, result confirms. The device frame carries over from Frame 3 (matched by the `push-slide LEFT` transition, reading as the same surface continuing) and now the cursor becomes the protagonist.

Scene 1 (0.0–2.4s): the device frame is present (carried by the transition); the custom indigo cursor enters from off-frame and DRAGS a small file-icon token toward the dashed dropzone; the dropzone border glows indigo on proximity (`context-sensitive-cursor`) — Centered, ~55%, cursor as actor.
Scene 2 (2.4–4.6s): the file drops in — the dropzone SWAPS state to a small file-thumbnail chip with a filename (`scale-swap-transition`); camera push-in (`coordinate-target-zoom`) tightens toward the action row that fades in beneath.
Scene 3 (4.6–8.0s): as the VO names each action, four pill chips — Convert / Compress / Split / Merge — stagger-assemble left→right into a row beneath the file chip, one per named word (`center-outward-expansion`), the cursor sweeping across them in sync.
Scene 4 (8.0–9.856s): on "No menus to dig through, no settings to configure", the cursor lands a CLICK on "Convert" — `cursor-click-ripple` fires, the chip springs on a smooth long-tail settle (`spring-pop-entrance`, `power3`) and a small indigo checkmark draws beside it (`svg-path-draw`) — camera settles static, holds.

## Frame 5 — It never leaves your device

- scene: Split-screen comparison — a file blocked on its way to a cloud icon (left) vs. the same file completing instantly on-device (right)
- voiceover: "There's no upload bar, because there's no upload. Every conversion happens right here, on your machine — your files never touch a server, ever."
- duration: 9.195s
- transition_in: crossfade
- status: animated
- src: compositions/frames/05-feature-privacy.html
- type: benefit_highlight
- persuasion: Risk reversal
- beat: trust + relief
- blueprint: comparison-split (Reproduce)
- focal: two constructed comparison cards ("the old way" cloud-upload vs. RawShift on-device) — no captured asset
- asset_candidates:
- sfx: whoosh

Third feature beat: the privacy/speed payoff that differentiates RawShift from every server-side converter. The "cloud path" is shown blocked; the "local path" completes instantly — a visual argument, not a claim.

Scene 1 (0.0–1.0s): centered title line "No upload." with the word "upload" in indigo slides DOWN into place from just above (title slide-down settle) — sets the concept.
Scene 2 (1.0–2.8s): two equal-width cards arrive from opposite wings with mirrored book-open `rotateY` tilts (`split-tilt-cards`, the signature move) — left card (muted gray, a file icon reaching for a cloud icon on a dashed path, blocked by a red X) from the left; right card (indigo-bordered, a file icon inside a laptop/device outline, an indigo checkmark) from the right ~0.2s behind, both scaling 0.85→1.
Scene 3 (2.8–5.6s): as the VO says "Every conversion happens right here, on your machine", the right card's checkmark draws itself (`svg-path-draw`) and a soft indigo glow blooms behind it (`ambient-glow-bloom`); the left card's cloud icon and dashed path dim further.
Scene 4 (5.6–9.195s): on "your files never touch a server, ever", a small pill badge lands at each card's inner edge (`spring-pop-entrance`, the one earned overshoot in this shot) — left badge reads "blocked", right badge reads "instant · local" — settles; a gentle phase-opposed idle float on the pair (`sine-wave-loop`, left `sin(t)` / right `sin(t+π)`, low amplitude) is the only aliveness; holds.

## Frame 6 — Value montage

- scene: Seven short value phrases pop center-frame in rapid succession, cut hard to the music
- voiceover: "Blazing fast. Always private. No uploads, ever. No file limits. No sign-up required. Completely free. Just drop your file, and go."
- duration: 10.005s
- transition_in: zoom-through
- status: animated
- src: compositions/frames/06-benefits-montage.html
- type: benefit_highlight
- persuasion: Rule of three (extended to seven, rapid-fire)
- beat: excitement -> confidence
- blueprint: kinetic-type-beats (Reproduce — Benefits variant)
- focal: constructed kinetic-type montage — no captured asset; phrases pulled from the site's own badges (Blazing fast, Always private) plus product facts
- asset_candidates:
- sfx: pop

Section boundary into the back third: fast benefit montage cut hard to the music. The one frame in the video that is motion-as-rhythm throughout rather than a single held read — 7 phrases at ~1.43s/beat, matched to the blueprint's high-tempo Benefits sub-shape.

Scene 1 (0.0–1.43s): near-black ground (ambient layer more present here, matching Frame 1's register); "Blazing fast" pops dead-center via a smooth spring-pop entrance (`spring-pop-entrance`, long-tail, no exaggerated overshoot) — Centered, ~40% of frame.
Scene 2 (1.43–2.86s): hard-cut swap (`discrete-text-sequence`) to "Always private"; background briefly flips to a deep indigo tint and back (bg-invert hard-flip) for emphasis.
Scene 3 (2.86–4.29s): hard-cut to "No uploads, ever."
Scene 4 (4.29–5.72s): hard-cut to "No file limits."
Scene 5 (5.72–7.15s): hard-cut to "No sign-up required."
Scene 6 (7.15–8.58s): hard-cut to "Completely free." — background flips indigo once more.
Scene 7 (8.58–10.005s): "Just drop your file, and go." lands and SETTLES — the one phrase that does not clear, holding to the frame's end while the ambient background keeps its slow deterministic drift underneath.

## Frame 7 — CTA

- scene: The RawShift wordmark condenses into a CTA pill, the cursor arrives and clicks it, the URL types in beneath
- voiceover: "This is RawShift. No uploads, no catches — try it now, free, at raw-shift.vercel.app."
- duration: 6.293s
- transition_in: crossfade
- status: animated
- src: compositions/frames/07-cta.html
- type: cta
- persuasion: Risk reversal
- beat: warmth + inevitability
- blueprint: cta-morph-press (Reproduce)
- focal: constructed wordmark lockup + CTA pill — no captured asset
- asset_candidates:
- sfx: chime

Close warm and confident: brand mark, one-line CTA, URL — the lockup the whole video has been earning. No new claims, just the invitation. Deliberate breather/hold frame, mirroring Frame 1.

Scene 1 (0.0–1.6s): the RawShift wordmark lockup (same treatment as Frame 2 — "Raw" near-black, "Shift" indigo gradient) holds dead-center over the ambient gradient-mesh layer settling into soft closing concentric rings; alive but resting, only a faint rotational breath scoped to the mark (`sine-wave-loop`, low amplitude) — camera static.
Scene 2 (1.6–3.2s): on "No uploads, no catches", the wordmark CONDENSES at the same screen center into a smaller, brighter indigo CTA pill reading "Try it free" — outgoing mark shrink-fades exactly as the CTA scales up in its place, sharing one `transform-origin` (`scale-swap-transition`) — the morph, this blueprint's signature move.
Scene 3 (3.2–4.6s): the custom indigo cursor arrives from off-stage on a decelerating path (`gsap-effects`, `power2.out`), landing a few px off the CTA's geometric center — a human-aimed approach, not a scripted snap-to-center.
Scene 4 (4.6–6.293s): on "try it now, free, at raw-shift.vercel.app", the cursor lands a physical CLICK — cursor and CTA compress together in lockstep, then release with a soft glow bloom (`physics-press-reaction`, `ambient-glow-bloom`); the URL "raw-shift.vercel.app" types in beneath the CTA, segment by segment (`discrete-text-sequence`), and holds static to the end.
