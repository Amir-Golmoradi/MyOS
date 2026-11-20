{ ... }:
{
  # ONLY for nix eval / nix build on Arch. NEVER deploy this hardware file.
  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_PREFLIGHT_DO_NOT_BOOT";
    fsType = "btrfs";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-label/NIXOS_PREFLIGHT_ESP_DO_NOT_BOOT";
    fsType = "vfat";
  };
  swapDevices = [ ];
}
