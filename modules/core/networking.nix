{ pkgs, ... }:
{
  networking.networkmanager.enable = true;
  services.resolved.enable = true;

  environment.systemPackages = with pkgs; [
  networkmanager-openvpn
  networkmanagerapplet
];


  programs.nm-applet.enable = true;

  # NetworkManager is authoritative: do not also run ConnMan as a manager.
}
