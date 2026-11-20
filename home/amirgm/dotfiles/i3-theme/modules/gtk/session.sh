#!/run/current-system/sw/bin/bash
# Launch one xsettingsd server for this i3 X11 session, if not already owned.
set -euo pipefail
ROOT="$HOME/.config/i3-theme"
command -v xsettingsd >/dev/null 2>&1 || exit 0
[[ -n "${DISPLAY:-}" ]] || exit 0
if pgrep -u "$(id -u)" -x xsettingsd >/dev/null 2>&1; then
  exit 0
fi
exec xsettingsd -c "$ROOT/xsettingsd/current.conf"
