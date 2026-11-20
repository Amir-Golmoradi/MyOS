{ ... }:
{
  imports = [
    ./kitty.nix
    ./git.nix
    ./neovim.nix
    ./i3.nix
    ./theme.nix
    ./dotfiles.nix
];
  home.username = "amirgm";
  home.homeDirectory = "/home/amirgm";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
