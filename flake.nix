
{
  description = "NixOS development workstation - i3, fish, Java and Kotlin";

  inputs = {
    nixpkgs.url =
      "https://channels.nixos.org/nixos-26.05/nixexprs.tar.zst";

    # Separate package source for JetBrains Toolbox.
    nixpkgs-toolbox.url =
      "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url =
        "https://github.com/nix-community/home-manager/archive/release-26.05.tar.gz";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url =
      "git+https://github.com/numtide/flake-utils?ref=main&shallow=1";

    elio = {
      url =
        "git+https://github.com/elio-fm/elio?ref=main&shallow=1";

      inputs.nixpkgs.url =
        "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
    };

    bookokrat = {
      url =
        "git+https://github.com/bugzmanov/bookokrat?ref=main&shallow=1";

      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.workstation =
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };

          modules = [
            {
              nixpkgs.hostPlatform = system;

              # Use unstable only for JetBrains Toolbox.
              nixpkgs.overlays = [
                (final: prev: {
                  jetbrains-toolbox =
                    (import inputs.nixpkgs-toolbox.outPath {
                      inherit system;
                      config.allowUnfree = true;
                    }).jetbrains-toolbox;
                })
              ];
            }

            # Host configuration.
            ./hosts/asus-tuf/default.nix

            # Hardware configuration.
            ./hosts/asus-tuf/hardware-configuration.nix

            # Home Manager.
            home-manager.nixosModules.home-manager

            # VPN client.
            ./modules/services/v2rayn.nix

            # Network GUI
            ./modules/services/nmrs.nix

            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "hm-backup";

              home-manager.users.amirgm =
                import ./home/amirgm;
            }
          ];
        };

      # Development environments.
      devShells.${system} = {
        java-kotlin =
          import ./devshells/java-kotlin.nix {
            inherit pkgs;
          };

        rust =
          import ./devshells/rust.nix {
            inherit pkgs;
          };

        c-cpp =
          import ./devshells/c-cpp.nix {
            inherit pkgs;
          };
      };
    };
}

