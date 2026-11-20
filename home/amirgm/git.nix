{ lib, ... }:
{
  home.file = lib.optionalAttrs (builtins.pathExists ./dotfiles/gitconfig) {
    ".gitconfig".source = ./dotfiles/gitconfig;
  };
}
