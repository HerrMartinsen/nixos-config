{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    claude-desktop-nix = {
      url = "github:tomsch/claude-desktop-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      ...
    }@inputs:
    let
      mkHost =
        {
          system,
          hostname,
          extraModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            hostname = hostname;
          };
          modules = [
            ./modules/nixos
            ./hosts/${hostname}/configuration.nix
            inputs.home-manager.nixosModules.default
            {
              nixpkgs.overlays = [
                (final: prev: {
                  stable = import nixpkgs-stable {
                    system = prev.system;
                    config = prev.config;
                  };
                })
                (inputs.helix.overlays.default)
              ];
            }
          ]
          ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        # Config Laptop
        yoga = mkHost {
          system = "x86_64-linux";
          hostname = "yoga";
          extraModules = [
            inputs.spicetify-nix.nixosModules.spicetify
            inputs.noctalia-greeter.nixosModules.default
            ./modules/nixos/hyprland.nix
            {
              nixpkgs.config.permittedInsecurePackages = [
                "electron-39.8.10"
              ];
            }
          ];
        };
        # Config Server RGB
        hermes = mkHost {
          system = "x86_64-linux";
          hostname = "hermes";
          extraModules = [ ];
        };
        # Config Server KB
        zeus = mkHost {
          system = "x86_64-linux";
          hostname = "zeus";
          extraModules = [ ];
        };
        hera = mkHost {
          system = "x86_64-linux";
          hostname = "hera";
          extraModules = [ ];
        };
      };

    };
}
