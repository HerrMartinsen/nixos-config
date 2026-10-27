{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";

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
            ./overlays
          ]
          ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        # Config Laptop
        yoga = mkHost {
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
          hostname = "hermes";
          extraModules = [ ];
        };
        # Config Server KB
        zeus = mkHost {
          hostname = "zeus";
          extraModules = [ ];
        };
        hera = mkHost {
          hostname = "hera";
          extraModules = [ ];
        };
      };

    };
}
