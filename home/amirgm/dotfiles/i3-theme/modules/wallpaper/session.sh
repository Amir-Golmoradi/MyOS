#!/run/current-system/sw/bin/bash
# Restores selected wallpaper at login without reloading i3.
set -euo pipefail
ROOT="$HOME/.config/i3-theme"
THEME='mocha'
if [[ -f "$ROOT/current" ]]; then read -r THEME < "$ROOT/current" || true; fi
case "$THEME" in mocha|latte) ;; *) THEME='mocha';; esac
export I3_THEME_ROOT="$ROOT" I3_THEME_NAME="$THEME"
exec "$ROOT/modules/wallpaper/apply.sh"
