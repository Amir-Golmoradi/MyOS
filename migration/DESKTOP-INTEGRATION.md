# Arch i3 desktop import - 2026-11-18

## Sources and fidelity

- `i3.zip`: original i3 config and Catppuccin Latte/Mocha palettes.
- `i3-theme.zip`: original theme module scripts, palettes, wallpapers.
- `desktop-config.zip` and `polybar.zip`: byte-for-byte identical archives;
  Polybar config/palettes, picom, fish config/prompt and i3-theme launchers.
- Original i3 keybinds, workspaces, icon fonts, launcher choices, Persian/English
  layout toggle, Kitty terminal, Elio, Throne and Polybar monitor selection retained.

## Changes needed for NixOS

1. Removed the duplicate `include ~/.config/i3/themes/current.conf`.
2. Removed Brave keyboard binding (user explicitly excluded Brave).
3. `~/.config/i3/themes/current.conf`, `~/.config/polybar/themes/current.ini`,
   `~/.config/i3-theme/current` and generated `xsettingsd/current.conf` are
   **runtime writable** (not Nix-store symlinks). `theme.nix` initializes them.
4. Runtime scripts now use system-provided Bash/Python interpreters at
   `/run/current-system/sw/bin/`. `modules/desktop/i3.nix` installs both.
5. Theme switcher applies i3/Polybar/GTK/dmenu/wallpaper/Firefox; omitted
   obsolete Brave/Alacritty modules from the active dispatcher.
6. Original dmenu wrapper defaulted to a custom centered dmenu patch (`-c`).
   Nixpkgs stock dmenu cannot be assumed to have it. Default centering has been
   disabled; install a reviewed patched dmenu if centering is important.
7. Polybar config combined duplicate `[colors]` section, fixed `lauve` typo
   and malformed transparent color; theme palette remains loaded at end.
8. The uploaded picom config had unmatched `rules` punctuation. Corrected the
   punctuation without changing the original appearance settings; runtime
   compatibility with the installed picom version is still unverified.
9. Fish copied only safe interactive config, custom prompt and `lv` function.
   Universal `fish_variables` and SDKMAN/uv/rustup auto-start snippets omitted
   because they point to Arch-specific or missing installations.
10. Original theme artifacts are linked using Home Manager. Changing theme
    should remain possible after activation; check behavior in a live i3 session.

## Important unresolved differences

- Uploaded Kitty `kitty.conf` and `current-theme.conf` are symbolic links to
  `../../dotfiles/kitty/.config/kitty/{kitty.conf,current-theme.conf}`. Those
  actual targets were NOT uploaded. Kitty will start with defaults until copied.
- `~/.config/dunst/`, `/etc/keyd/*.conf`, `~/.Xresources` were not provided.
- `~/wallpapers/WLX.jpg`, `~/wallpapers/WLX-light.jpg` were not provided;
  the archived Catppuccin PNG wallpaper assets are used as fallback.
- `Mod+i` launches `idea`; JetBrains Toolbox is packaged, but a working `idea`
  launcher is NOT guaranteed until Toolbox sets it up.
- Other i3 commands `dex`, `udiskie`, `nm-applet`, `nm-connection-editor`,
  `xrdb`, `notify-send`, `pactl`, and `killall` have been added as dependencies.
- The battery name `BAT1`, adapter `ACAD`, and Polybar monitor assumptions
  must be checked against `/sys/class/power_supply/` and your real X11 session.
- Picom EGL backend, GL/NVIDIA behavior, GTK app theme updates, and X11
  keyboard actions need testing on the actual NixOS hardware.
- `i3-theme-dmenu` no longer passes patched-only `-c` by default.
- Because your original shell theme scripts invoke `bash` directly and do
  write files under your home, avoid treating them as purely declarative.

## Before installation

1. Merge this ZIP into EXISTING `~/arch-to-nixos` with a diff, not a blind copy.
2. Preserve your existing `flake.lock` and any local edits.
3. Validate with `nix flake lock` and the asus-tuf-preflight evaluation in README.
4. On Arch, obtain missing Kitty source config and the remaining dotfiles.
5. Confirm Déjà Dup can restore actual projects before touching internal SSD.
6. Replace installer-blocked hardware config with actual generated configuration.

This archive has only been checked statically in the authoring environment;
NO live NixOS flake evaluation or boot test has been performed here.
