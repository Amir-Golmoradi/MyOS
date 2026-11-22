
{ lib, ... }:

{
  home.file =
    {
      # Fish
      ".config/fish/config.fish".source =
        ./dotfiles/fish/config.fish;

      ".config/fish/functions/fish_prompt.fish".source =
        ./dotfiles/fish/functions/fish_prompt.fish;

      ".config/fish/functions/lv.fish".source =
        ./dotfiles/fish/functions/lv.fish;
      
      # OpenVPN Management
      ".config/fish/functions/vpn-on.fish".source =
      ./dotfiles/fish/functions/vpn-on.fish;

      ".config/fish/functions/vpn-off.fish".source =
      ./dotfiles/fish/functions/vpn-off.fish;

      ".config/fish/functions/vpn-status.fish".source =
      ./dotfiles/fish/functions/vpn-status.fish;
       
       # Update Codex
      ".config/fish/functions/codex-update.fish".source =
      ./dotfiles/fish/functions/codex-update.fish;

      # Change Wallpaper
      ".config/fish/functions/wallpaper.fish".source =
       ./dotfiles/fish/functions/wallpaper.fish;

      # NixOS management functions
      ".config/fish/functions/nix-rebuild.fish".source =
        ./dotfiles/fish/functions/nix-rebuild.fish;

      ".config/fish/functions/nix-gc.fish".source =
        ./dotfiles/fish/functions/nix-gc.fish;

      # Polybar
      ".config/polybar/config.ini".source =
        ./dotfiles/polybar/config.ini;

      ".config/polybar/launch_polybar.sh".source =
        ./dotfiles/polybar/launch_polybar.sh;

      ".config/polybar/themes/mocha.ini".source =
        ./dotfiles/polybar/themes/mocha.ini;

      ".config/polybar/themes/latte.ini".source =
        ./dotfiles/polybar/themes/latte.ini;
    }

    # Picom
    // lib.optionalAttrs
      (builtins.pathExists ./dotfiles/picom/picom.conf)
      {
        ".config/picom/picom.conf".source =
          ./dotfiles/picom/picom.conf;
      }

    # Dunst
    // lib.optionalAttrs
      (builtins.pathExists ./dotfiles/dunst)
      {
        ".config/dunst" = {
          source = ./dotfiles/dunst;
          recursive = true;
        };
      }

    # GTK 4
    // lib.optionalAttrs
      (builtins.pathExists ./dotfiles/gtk-4.0)
      {
        ".config/gtk-4.0" = {
          source = ./dotfiles/gtk-4.0;
          recursive = true;
        };
      };

  # Do not restore Arch fish_variables or SDKMAN/rustup/uv
  # autoinit without adapting them for NixOS.

  # Theme-managed files must remain user-writable:
  # - .config/polybar/current.ini
  # - .config/gtk-3.0/settings.ini
  # - .config/xsettingsd/current.conf
  #
  # Do not symlink these files into the Nix store.
}

