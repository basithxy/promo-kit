#!/usr/bin/env bash
# ==============================================
#  PromoKit - one-time setup for macOS / Linux
#  Usage:  bash setup.sh
# ==============================================
set -u

echo ""
echo "[0/6] Detecting OS..."
OS="$(uname -s)"
case "$OS" in
  Darwin) PLATFORM="mac";   echo "      macOS detected." ;;
  Linux)  PLATFORM="linux"; echo "      Linux detected." ;;
  *)      echo "      Unsupported OS: $OS (this script is for Mac/Linux; use setup.ps1 on Windows)"; exit 1 ;;
esac

echo ""
echo "[1/6] Removing any API key vars (subscription-only guarantee)..."
unset ANTHROPIC_API_KEY 2>/dev/null || true
unset ANTHROPIC_BASE_URL 2>/dev/null || true
# Warn if they are pinned in shell profiles (from past Ollama/Oracle experiments)
for f in "$HOME/.zshrc" "$HOME/.zprofile" "$HOME/.bashrc" "$HOME/.bash_profile" "$HOME/.profile"; do
  if [ -f "$f" ] && grep -qE "ANTHROPIC_API_KEY|ANTHROPIC_BASE_URL" "$f"; then
    echo "      NOTE: found an ANTHROPIC_ var in $f"
    echo "            comment it out (put # in front) so Claude Code uses your subscription, not API."
  fi
done
echo "      Session cleared."

echo ""
echo "[2/6] Checking Homebrew (Mac package manager)..."
if [ "$PLATFORM" = "mac" ]; then
  if ! command -v brew >/dev/null 2>&1; then
    echo "      Homebrew not found. Installing it (will ask for your Mac password)..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # add brew to PATH for Apple Silicon + Intel
    if [ -x /opt/homebrew/bin/brew ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi
    if [ -x /usr/local/bin/brew ]; then eval "$(/usr/local/bin/brew shellenv)"; fi
  else
    echo "      Homebrew present."
  fi
fi

echo ""
echo "[3/6] Installing prerequisites (node, ffmpeg, git)..."
if [ "$PLATFORM" = "mac" ]; then
  brew install node ffmpeg git
else
  echo "      Linux: install via your package manager, e.g.:"
  echo "        sudo apt update && sudo apt install -y ffmpeg git"
  echo "        (node 22+ via https://nodejs.org or nvm)"
fi

echo ""
echo "[4/6] Verifying tools..."
ALLOK=1
for t in node ffmpeg git; do
  if command -v "$t" >/dev/null 2>&1; then
    echo "      OK       $t  ->  $(command -v $t)"
  else
    echo "      MISSING  $t  (open a NEW terminal and re-run setup.sh)"; ALLOK=0
  fi
done
if command -v node >/dev/null 2>&1; then
  NODE_MAJOR="$(node -v | sed 's/v//' | cut -d. -f1)"
  if [ "$NODE_MAJOR" -lt 22 ]; then
    echo "      WARNING  Node 22+ required for HyperFrames (found v$NODE_MAJOR)"
  fi
fi

echo ""
echo "[5/6] Installing Claude Code + HyperFrames skills..."
npm install -g @anthropic-ai/claude-code
npx --yes skills add heygen-com/hyperframes --all

echo ""
echo "[6/6] Done."
echo "================ SETUP COMPLETE ================"
echo " Next:"
echo "   1. Type:  claude"
echo "   2. Log in with your CLAUDE ACCOUNT (subscription), NOT an API key"
echo "   3. Run /status  ->  must show Pro plan, not API"
echo "   4. Open PROMPTS.md, copy a prompt, paste it into Claude"
echo "================================================"
