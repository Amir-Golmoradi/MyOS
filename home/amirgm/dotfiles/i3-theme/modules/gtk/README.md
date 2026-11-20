# GTK / Thunar / Mousepad

Uses Arch's `adw-gtk-theme` package: `adw-gtk3` for Latte and `adw-gtk3-dark` for Mocha. Calls `gsettings set org.gnome.desktop.interface gtk-theme` and `color-scheme`, preserves unrelated values in `~/.config/gtk-3.0/settings.ini`, and uses lightweight `xsettingsd` on X11 to notify GTK apps of the selected GTK theme.

The session helper launches xsettingsd only if no daemon of that name is already running. Other XSETTINGS managers (e.g. xfsettingsd) can conflict; do not run two XSETTINGS owners. GTK4/libadwaita follows the color-scheme preference, not arbitrary GTK3 CSS themes. Some running apps may need restart.
