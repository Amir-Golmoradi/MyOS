# Imported Arch desktop configuration

This directory now includes i3, Polybar, picom, fish prompt, theme scripts,
Catppuccin assets, and mutable-theme initializers as described in:
`migration/DESKTOP-INTEGRATION.md`.

DO NOT add archived `fish_variables` blindly: it contains Arch absolute paths.
DO NOT overwrite your dotfiles or ~/.config/i3-theme/current on an existing
NixOS installation without taking a backup. Home Manager manages most static
files as links to the immutable Nix store, but *current themes* remain writable.

Not yet provided: original Kitty source targets, ~/.config/dunst,
/etc/keyd/*.conf, ~/.Xresources, personal wallpaper images.
