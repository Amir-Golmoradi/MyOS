#!/run/current-system/sw/bin/bash
set -euo pipefail
DIR="$HOME/.config/polybar/themes"
[[ -f "$DIR/$I3_THEME_NAME.ini" ]] || {
  echo 'Missing Polybar palette' >&2
  exit 1
}
ln -sfn "$DIR/$I3_THEME_NAME.ini" "$DIR/.current.ini.$$"
mv -Tf "$DIR/.current.ini.$$" "$DIR/current.ini"
if [[ -z "${DISPLAY:-}" ]] || ! command -v polybar >/dev/null 2>&1; then exit 0; fi
if command -v polybar-msg >/dev/null 2>&1; then
  # Only works for running bars with enable-ipc = true.
  if polybar-msg cmd restart >/dev/null 2>&1; then exit 0; fi
fi
# Preserve the user's existing bar launcher (and monitor/bar naming).
LAUNCH="$HOME/.config/polybar/launch_polybar.sh"
if [[ -f "$LAUNCH" ]]; then
  pkill -u "$(id -u)" -x polybar 2>/dev/null || true
  nohup bash "$LAUNCH" 9>&- >/dev/null 2>&1 </dev/null &
else
  echo 'Polybar IPC unavailable and launch_polybar.sh missing: restart Polybar manually.' >&2
fi
