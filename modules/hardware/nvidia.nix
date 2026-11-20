{ config, ... }:
{
  # RTX 2050 on ASUS FA706NFR. Avoid blindly enabling PRIME: verify lspci
  # before adding iGPU bus IDs (Ryzen 7 7435HS systems may be dGPU-only).
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
