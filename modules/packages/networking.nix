{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bind dnsmasq iw openvpn openconnect xray
];

}
