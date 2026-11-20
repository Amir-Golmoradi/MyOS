{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.meslo-lg
    nerd-fonts.caskaydia-cove
    nerd-fonts.symbols-only
    cascadia-code
    dejavu_fonts
    liberation_ttf
    noto-fonts
    noto-fonts-color-emoji
    # vazirmatn
    font-awesome
  ];
  # Custom/licensed fonts (SF Pro, Maple Mono) are not redistributed.
}
