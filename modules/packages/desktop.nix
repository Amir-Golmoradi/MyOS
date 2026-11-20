{ pkgs, ... }:
let
  # The Nixpkgs spelling has changed on some channels; fail clearly if missing.
  backupApp = if pkgs ? dejadup then pkgs.dejadup else pkgs."deja-dup";
in {
  environment.systemPackages = with pkgs; [
    firefox mpv mousepad transmission_4-qt
    #jetbrains-toolbox 
    obsidian slack telegram-desktop #discord
  ] ++ [ backupApp ];
  # No Brave, Bruno, Fresh Editor, Windscribe, or Zulip.
}
