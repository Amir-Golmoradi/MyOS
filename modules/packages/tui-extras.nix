
{ pkgs, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;

  elioPkgs =
    inputs.elio.inputs.nixpkgs.legacyPackages.${system};

  elio =
    inputs.elio.packages.${system}.default.overrideAttrs
      (old: {
        buildInputs =
          (old.buildInputs or []) ++ [
            elioPkgs.sqlite
          ];
      });
in
{
  environment.systemPackages = [
    pkgs.lazysql
    elio
    inputs.bookokrat.packages.${system}.default
  ];
}

