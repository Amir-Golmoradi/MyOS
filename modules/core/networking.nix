{ ... }:
{
  networking.networkmanager.enable = true;
  services.resolved.enable = true;
  # NetworkManager is authoritative: do not also run ConnMan as a manager.
}
