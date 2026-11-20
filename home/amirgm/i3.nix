{ ... }:
{
  home.file = {
    ".config/i3/config".source = ./dotfiles/i3/config;
    ".config/i3/themes/mocha.conf".source = ./dotfiles/i3/themes/mocha.conf;
    ".config/i3/themes/latte.conf".source = ./dotfiles/i3/themes/latte.conf;
  };
  # current.conf intentionally is NOT Home Manager-managed. i3-theme changes it.
}
