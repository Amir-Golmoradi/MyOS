#!/run/current-system/sw/bin/bash
set -euo pipefail
DIR="$HOME/.config/i3/themes"
[[ -f "$DIR/$I3_THEME_NAME.conf" ]] || { echo 'Missing i3 palette' >&2; exit 1; }
OLD_LINK=''
if [[ -L "$DIR/current.conf" ]]; then OLD_LINK="$(readlink "$DIR/current.conf")"; fi
ln -sfn "$DIR/$I3_THEME_NAME.conf" "$DIR/.current.conf.$$"
mv -Tf "$DIR/.current.conf.$$" "$DIR/current.conf"
# i3's include parser must see the final file. No i3 session? Keep assets updated.
if command -v i3 >/dev/null 2>&1 && [[ -f "$HOME/.config/i3/config" ]]; then
  if ! i3 -C -c "$HOME/.config/i3/config" >/dev/null; then
    if [[ -n "$OLD_LINK" ]]; then
      ln -sfn "$OLD_LINK" "$DIR/.current.conf.revert.$$"
      mv -Tf "$DIR/.current.conf.revert.$$" "$DIR/current.conf"
    fi
    echo 'i3 config failed validation; previous i3 theme symlink restored.' >&2
    return 1
  fi
fi
if command -v i3-msg >/dev/null 2>&1 && [[ -n "${DISPLAY:-}" ]]; then
  i3-msg reload >/dev/null
fi
