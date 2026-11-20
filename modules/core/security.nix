{ ... }:
{
  networking.firewall.enable = true;
  security.polkit.enable = true;
  programs.ssh.startAgent = true;
# Leave Secure Boot as an explicit post-install hardening decision.

}
