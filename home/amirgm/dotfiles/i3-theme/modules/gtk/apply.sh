#!/run/current-system/sw/bin/bash
set -euo pipefail
case "$I3_THEME_NAME" in
latte)
  GTK_THEME_NAME='adw-gtk3'
  SCHEME='prefer-light'
  ;;
mocha)
  GTK_THEME_NAME='adw-gtk3-dark'
  SCHEME='prefer-dark'
  ;;
*) exit 2 ;;
esac
export GTK_THEME_NAME SCHEME
# Existing GTK apps can get XSETTINGS notifications; new ones also read ini.
python3 "$I3_THEME_ROOT/modules/gtk/apply_settings.py" "$HOME/.config/gtk-3.0/settings.ini" "$GTK_THEME_NAME" "$SCHEME"
mkdir -p "$I3_THEME_ROOT/xsettingsd"
printf 'Net/ThemeName "%s"\n' "$GTK_THEME_NAME" >"$I3_THEME_ROOT/xsettingsd/current.conf.tmp.$$"
mv -f "$I3_THEME_ROOT/xsettingsd/current.conf.tmp.$$" "$I3_THEME_ROOT/xsettingsd/current.conf"
if command -v gsettings >/dev/null 2>&1; then
  if gsettings list-schemas | grep -qx org.gnome.desktop.interface; then
    gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME_NAME" || true
    gsettings set org.gnome.desktop.interface color-scheme "$SCHEME" || true
  fi
fi
if command -v xsettingsd >/dev/null 2>&1 && [[ -n "${DISPLAY:-}" ]]; then
  # Signal only the daemon launched with our config, not an unrelated XSettings daemon.
  for pid in $(pgrep -u "$(id -u)" -x xsettingsd || true); do
    if [[ -r "/proc/$pid/cmdline" ]] && tr '\0' ' ' <"/proc/$pid/cmdline" | grep -Fq "$I3_THEME_ROOT/xsettingsd/current.conf"; then
      kill -HUP "$pid" 2>/dev/null || true
    fi
  done
  if ! pgrep -u "$(id -u)" -x xsettingsd >/dev/null 2>&1; then
    nohup "$I3_THEME_ROOT/modules/gtk/session.sh" >/dev/null 2>&1 </dev/null &
  fi
fi
