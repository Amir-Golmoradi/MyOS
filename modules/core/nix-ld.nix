{ pkgs, ... }:
{
  # Enables dynamic Linux binaries downloaded by Gradle/Kotlin Native or
  # JetBrains tools. Only a starting library set; extend when needed.
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      zlib zstd stdenv.cc.cc openssl curl libxml2 xz
    ];
  };
}
