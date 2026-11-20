#!/run/current-system/sw/bin/bash
# Firefox follows GTK for System theme - auto. Do not write prefs.js or
# user.js while Firefox is running: that would be unreliable and intrusive.
set -euo pipefail
if command -v gsettings >/dev/null 2>&1; then
  # The GTK module already sets this; separate check keeps the browser independent.
  gsettings get org.gnome.desktop.interface color-scheme >/dev/null 2>&1 || true
fi
