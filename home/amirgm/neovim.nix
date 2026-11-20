{ lib, ... }:
{
  home.file = lib.optionalAttrs (builtins.pathExists ./dotfiles/nvim) {
    ".config/nvim" = { source = ./dotfiles/nvim; recursive = true; };
  };
}
