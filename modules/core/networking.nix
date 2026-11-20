{ pkgs, ... }:
{
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openvpn
    ];
  };

  services.resolved.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];

  programs.nm-applet.enable = true;

  # NetworkManager is authoritative: do not also run ConnMan.
}
