#!/run/current-system/sw/bin/bash
set -euo pipefail
[[ -n "${DISPLAY:-}" ]] || exit 0
# Prefer user's own wallpaper if present.  Bundled art is the fallback.
if [[ "$I3_THEME_NAME" == 'mocha' ]]; then
  IMAGE="$HOME/wallpapers/WLX.jpg"
  [[ -f "$IMAGE" ]] || IMAGE="$I3_THEME_ROOT/wallpapers/mocha.png"
else
  IMAGE="$HOME/wallpapers/WLX-light.jpg"
  [[ -f "$IMAGE" ]] || IMAGE="$I3_THEME_ROOT/wallpapers/latte.png"
fi
if command -v feh >/dev/null 2>&1 && [[ -f "$IMAGE" ]]; then
  feh --no-fehbg --bg-fill "$IMAGE"
else
  echo 'feh missing or wallpaper unavailable (install feh).' >&2
fi
