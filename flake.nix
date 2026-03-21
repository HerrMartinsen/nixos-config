{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix = {
      url = "github:helix-editor/helix";
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
            ./modules
            ./hosts/${hostname}/configuration.nix
            inputs.home-manager.nixosModules.default
          ]
          ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        yoga = mkHost {
          system = "x86_64-linux";
          hostname = "yoga";
          extraModules = [
            {
              nixpkgs.overlays = [
                (final: prev: {
                  stable = import nixpkgs-stable {
                    system = prev.system;
                  };
                })
                (inputs.helix.overlays.default)
              ];
            }
            inputs.catppuccin.nixosModules.catppuccin
            ./modules/nixos/hyprland.nix
          ];
        };
      };

    };
}
