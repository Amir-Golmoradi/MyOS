{ ... }:
{
  imports = [
    ./kitty.nix
    ./git.nix
    ./zed.nix
    ./neovim.nix
    ./i3.nix
    ./theme.nix
    ./dotfiles.nix
    ./packages.nix
];
  home.username = "amirgm";
  home.homeDirectory = "/home/amirgm";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
