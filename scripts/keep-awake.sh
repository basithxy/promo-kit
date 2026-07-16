#!/usr/bin/env bash
# Runs a command with macOS/Linux sleep prevention held for its duration, and
# (optionally) records the command's wall-clock time as JSON. Mac/Linux
# counterpart to keep-awake.ps1 - see that file for why this exists.
#
# Usage:
#   scripts/keep-awake.sh [--log <path>] -- <command> [args...]
#
# Example:
#   scripts/keep-awake.sh --log videos/acme/renders/render_time.json -- \
#     npx hyperframes render --quality standard --output renders/video.mp4

set -u

LOG=""
if [ "${1:-}" = "--log" ]; then
  LOG="$2"
  shift 2
fi
if [ "${1:-}" = "--" ]; then
  shift
fi
if [ "$#" -eq 0 ]; then
  echo "keep-awake: no command given" >&2
  exit 1
fi

start=$(date +%s)
status=0

if command -v caffeinate >/dev/null 2>&1; then
  # macOS: -i prevents idle sleep for the wrapped process's lifetime only.
  caffeinate -i "$@" || status=$?
elif command -v systemd-inhibit >/dev/null 2>&1; then
  # Linux (systemd): inhibits sleep/idle only while the command runs.
  systemd-inhibit --what=sleep:idle --why="hyperframes render" "$@" || status=$?
else
  echo "keep-awake: no sleep-inhibit tool found (caffeinate/systemd-inhibit) - running without sleep protection" >&2
  "$@" || status=$?
fi

end=$(date +%s)
elapsed=$((end - start))

if [ -n "$LOG" ]; then
  mkdir -p "$(dirname "$LOG")"
  cmd_json=$(printf '%s ' "$@" | sed 's/"/\\"/g' | sed 's/ $//')
  finished_at=$(date -u +"%Y-%m-%dT%H:%M:%S.000Z")
  printf '{\n  "command": "%s",\n  "seconds": %s,\n  "exitCode": %s,\n  "finishedAt": "%s"\n}\n' \
    "$cmd_json" "$elapsed" "$status" "$finished_at" > "$LOG"
fi

exit $status
