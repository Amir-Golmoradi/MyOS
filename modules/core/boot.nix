{ ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.efi.canTouchEfiVariables = true;
  # Partitioning, encryption, root Btrfs subvolumes, and initrd modules
  # come from the target machine's generated hardware configuration.
}
