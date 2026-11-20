{ pkgs, ... }:

{

  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
  zramSwap.enable = true;


  environment.systemPackages = [
    (pkgs.writeShellScriptBin "tlp-profile"
      (builtins.readFile ./tlp-profile))
  ];
}
