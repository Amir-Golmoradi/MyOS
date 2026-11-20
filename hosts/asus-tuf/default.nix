{ ... }:
{
  imports = [
    ../../modules/core/boot.nix
    ../../modules/core/networking.nix
    ../../modules/core/users.nix
    ../../modules/core/security.nix
    ../../modules/core/nix-settings.nix
    ../../modules/core/nix-ld.nix
    ../../modules/desktop/i3.nix
    ../../modules/desktop/display-manager.nix
    ../../modules/desktop/audio.nix
    ../../modules/desktop/bluetooth.nix
    ../../modules/desktop/file-integration.nix
    ../../modules/hardware/nvidia.nix
    ../../modules/hardware/asus.nix
    ../../modules/hardware/power.nix
    ../../modules/services/docker.nix
    ../../modules/services/ssh.nix
    ../../modules/services/keyd.nix
    ../../modules/packages/default.nix
  ];

  networking.hostName = "asus-tuf";
  # CHANGE if required: do not assume current travel location is your permanent timezone.
  time.timeZone = "Asia/Tehran";
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "26.05";
}
