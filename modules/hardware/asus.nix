{ ... }:
{
  services.asusd.enable = true;
  # Do not enable supergfxd or PRIME mode switching before verifying the
  # laptop's actual GPU topology and ASUS compatibility.
}
