{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dmidecode smartmontools wireshark
    inotify-tools
  ];
  programs.wireshark.enable = true;
}
