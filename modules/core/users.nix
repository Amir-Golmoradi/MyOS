{ pkgs, ... }:
{
  programs.fish.enable = true;
  users.users.amirgm = {
    isNormalUser = true;
    home = "/home/amirgm";
    createHome = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" "docker" "video" "input" ];
  };
  # Set a real password on the installer with passwd, never in a public flake.
  security.sudo.wheelNeedsPassword = true;
}
