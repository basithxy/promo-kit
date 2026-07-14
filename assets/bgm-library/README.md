# Bundled royalty-free BGM library

Mirrors the `media-use` skill's bundled SFX library (see
`.agents/skills/media-use/audio/assets/sfx/CREDITS.md`): a small, license-clear
set of background-music tracks kept locally so a render never has to fall back
to MusicGen's non-commercial-licensed output. Preferred first, ahead of both
MusicGen generation and (unless already signed in) HeyGen retrieval - see
CLAUDE.md's "Voice & music" section.

## Folders (match `bgm.md`'s mood-inference table)

- `calm-cinematic/` - soft strings, subtle piano - finance/fintech-style briefs
- `uplifting-corporate/` - bright modern piano + synth pads - default SaaS/tech
- `playful/` - warm pads, light percussion - creative/agency/design briefs
- `atmospheric-electronic/` - deep bass, futuristic synths - crypto/web3/defi

## How to populate this (no account needed)

This machine can't reliably auto-download real audio files (Pixabay blocks
bare/bot requests, and there's no binary-fetch tool available here) - so add a
handful of tracks yourself, once:

1. Go to a royalty-free source with a clear commercial-use license, e.g.
   [pixabay.com/music](https://pixabay.com/music/) (Pixabay Content License -
   same one the bundled SFX already use: free commercial use, no attribution
   required) - or any other source under a license that's actually clear for
   commercial video (CC0, or CC-BY if you're willing to credit it).
2. Pick 2-3 tracks per mood folder above, ~30-90s or loopable, save as `.mp3`.
3. Record the license for each file in `CREDITS.md` (template below) - if you
   used Pixabay, that's it, no attribution needed but keep the record for your
   own reference.
4. Add an entry per file to `manifest.json`, e.g.:
   ```json
   "calm-cinematic": [
     { "file": "track-1.mp3", "duration_s": 45.2, "description": "soft strings, gentle build" }
   ]
   ```

Once a mood folder has files + manifest entries, Claude will prefer this
library over generating music for any brief that maps to that mood.

## CREDITS.md template

```markdown
# BGM Credits

- `calm-cinematic/track-1.mp3` - Pixabay Content License - https://pixabay.com/music/...
- `uplifting-corporate/track-1.mp3` - Pixabay Content License - https://pixabay.com/music/...
```
