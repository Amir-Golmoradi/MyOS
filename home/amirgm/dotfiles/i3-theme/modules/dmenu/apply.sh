#!/run/current-system/sw/bin/bash
# No resident process: the dmenu wrapper chooses colors when opened.
set -euo pipefail
[[ -x "$HOME/.local/bin/i3-theme-dmenu" ]]
