{ lib, ... }:
{
  home.file = {
    ".config/i3-theme/modules" = {
      source = ./dotfiles/i3-theme/modules;
      recursive = true;
    };
    ".config/i3-theme/wallpapers" = {
      source = ./dotfiles/i3-theme/wallpapers;
      recursive = true;
    };
    ".config/i3-theme/palettes.json".source = ./dotfiles/i3-theme/palettes.json;
    ".local/bin/i3-theme".source = ./dotfiles/bin/i3-theme;
    ".local/bin/i3-theme-dmenu".source = ./dotfiles/bin/i3-theme-dmenu;
    ".local/bin/i3-theme-toggle".source = ./dotfiles/bin/i3-theme-toggle;
    ".local/bin/i3-theme-debug".source = ./dotfiles/bin/i3-theme-debug;
  };

  # The original Catppuccin theme switcher changes these files at runtime.
  # They must NOT be Home Manager symlinks into the immutable Nix store.
  home.activation.initializeI3Theme = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    root="$HOME/.config/i3-theme"
    mkdir -p "$root/xsettingsd" "$HOME/.config/i3/themes" "$HOME/.config/polybar/themes"
    if [ ! -f "$root/current" ]; then
      printf '%s\n' mocha > "$root/current"
    fi
    theme="$(cat "$root/current")"
    case "$theme" in
      mocha|latte) ;;
      *) theme=mocha; printf '%s\n' "$theme" > "$root/current" ;;
    esac
    if [ ! -e "$HOME/.config/i3/themes/current.conf" ]; then
      ln -s "$theme.conf" "$HOME/.config/i3/themes/current.conf"
    fi
    if [ ! -e "$HOME/.config/polybar/themes/current.ini" ]; then
      ln -s "$theme.ini" "$HOME/.config/polybar/themes/current.ini"
    fi
    if [ ! -e "$root/xsettingsd/current.conf" ]; then
      case "$theme" in
        latte) printf 'Net/ThemeName "adw-gtk3"\n' > "$root/xsettingsd/current.conf" ;;
        *) printf 'Net/ThemeName "adw-gtk3-dark"\n' > "$root/xsettingsd/current.conf" ;;
      esac
    fi
  '';
}
