---
description: Guided Q&A intake for a new promo video - no manual PROMPTS.md editing/copy-pasting required.
argument-hint: [optional product name]
---

# /video-agent - guided video intake

Replace the manual "open PROMPTS.md, edit placeholders, paste" flow with a short
guided interview, then hand off to the normal HyperFrames pipeline. Use
AskUserQuestion for genuine multiple-choice steps; ask name/URL as plain text.
Ask one question at a time. Don't re-ask anything already answered (including
`$ARGUMENTS` if a product name was passed), and don't print this checklist back
at the user - just run it.

## 1. What are we making?
AskUserQuestion, single-select:
- **SaaS / software or app** - a digital product/service
- **A physical product** - one item: a bag, book, clothing, gadget, food,
  etc. - not a whole store, just this thing
- **An e-commerce store or catalog** - the whole site/storefront, multiple
  products, not one item
- **Informational or company website** - a tour/showcase, not a sales pitch

("Other" -> ask for a one-line description, treat as physical-product default
if it's a tangible thing, otherwise SaaS/software.)

### 1b. Only if "SaaS / software or app" was picked
AskUserQuestion, single-select:
- **Full product launch** - the whole product/app
- **One new feature** - a feature-announcement video for an existing product

## 2. Style
Skip this step if step 1 was "informational website" (always cinematic).
AskUserQuestion, single-select:
- **Polished cinematic** (default) - Apple/Linear/Vercel-style narrated promo,
  GSAP/Three.js motion. This is what PROMPTS.md's default prompts produce.
- **UGC / testimonial style** - handheld, casual, authentic voice; still real
  captured footage/screens, lighter motion, less "corporate."

This answer also picks the voice per CLAUDE.md's "Voice & music" rules -
cinematic -> marketing/promo Kokoro voices with a calm->energetic->warm speed
arc; UGC -> casual/social voices with more line-to-line speed variance. Don't
default to the same voice as the last video generated in this project.

## 3. Name
Plain text question: "Product/company name?" Use `$ARGUMENTS` instead of
asking if a name was already passed to the command. This becomes the folder
`./videos/<name>/`.

## 4. Input source
AskUserQuestion, single-select:
- **A URL** - scrape it for copy, branding, screenshots
- **Screenshots or photos** - no URL
- **A screen recording** - show the real product/site in action
- **URL + a screen recording** - both

Then, depending on the answer:
- **URL involved** -> ask for it as plain text.
- **Screenshots/photos or screen recording involved** -> create
  `./videos/<name>/input/` now and tell the user that exact path. They can
  (a) drop the file(s) there in their file explorer, (b) paste an image
  straight into this chat - the VS Code extension accepts pasted
  images/screenshots directly in the message box, save it into `input/` - or
  (c) give an absolute path and you copy it in yourself. Wait for confirmation
  the file(s) are in place before continuing.

## 5. Build the brief and route (no PROMPTS.md copy-paste needed)
Using the answers above, construct the same complete brief PROMPTS.md's
matching numbered prompt contains - goal duration, 3-act structure, motion
requirements, voice, audio, quality pass - reusing that exact wording so
output quality doesn't regress:
- Input = URL only -> PROMPTS.md #1 (FROM A URL)
- Input = screen recording (with or without URL) -> PROMPTS.md #2 (FROM A
  SCREEN RECORDING)
- Input = screenshots/photos only -> PROMPTS.md #3 (FROM SCREENSHOTS / PHOTOS)

Then apply these overrides on top of whichever brief you picked:
- **Step 1 = "A physical product"** -> this is a tangible item, not software.
  Drop any "device/browser mockup" language from the brief - a bag or a book
  doesn't live inside a phone frame. Instead: clean studio/lifestyle
  background, slow Ken Burns zoom/pan and turntable-style rotation on the
  product photos, GSAP-animated callouts pointing at materials/details/specs
  instead of UI feature callouts, same music/voice/CTA structure otherwise.
- **Step 1 = "An e-commerce store or catalog"** -> treat like a SaaS/website
  brief but the "UI" being recreated is the storefront (product grid, cart,
  checkout), not an app dashboard.
- **Step 1b = "One new feature"** -> shrink the STRUCTURE section to one
  feature deep-dive instead of 3 features: hook -> product/feature name -> one
  extended feature demo beat -> CTA.
- **Step 2 = "UGC / testimonial style"** -> override VOICE and MOTION:
  handheld/authentic narration, lighter motion, fewer polished Three.js/GSAP
  flourishes, simpler captions.

Route to the workflow skill:
- Step 1 = "Informational or company website" -> `/website-to-video`
- everything else (SaaS, physical product, e-commerce, feature) ->
  `/product-launch-video`

## 6. Proceed as a normal run
From here, follow `CLAUDE.md` exactly as any other run: scaffold
`./videos/<name>/`, write `meta.json` (`createdAt`) and `progress.json`
(phase `research`), and continue through the phased / checkpointed /
subagent-delegated pipeline already defined there (session & token budget,
resume checkpoints, usage logging all still apply). Don't re-ask anything
already answered in this interview.
