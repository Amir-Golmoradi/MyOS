{ pkgs, ... }:

let
  customFonts = pkgs.stdenvNoCC.mkDerivation {
    pname = "local-fonts";
    version = "1.0";

    src = ../../fonts/fonts;

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/share/fonts/truetype
      find . -type f \( -iname '*.ttf' -o -iname '*.otf' \) \
        -exec cp {} $out/share/fonts/truetype/ \;
    '';
  };
in
{
  fonts.fontconfig.enable = true;

  fonts.packages = with pkgs; [
    # Nerd Fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.meslo-lg
    nerd-fonts.caskaydia-cove
    nerd-fonts.symbols-only

    # General fonts
    cascadia-code
    dejavu_fonts
    liberation_ttf
    noto-fonts
    noto-fonts-color-emoji
    font-awesome

    # Locally supplied fonts
    customFonts
  ];
}
