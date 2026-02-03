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
    # hyprland = {
    #   url = "github:hyprwm/Hyprland";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
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
    {
      nixosConfigurations.yoga = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
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
          ./hosts/yoga/configuration.nix
          ./modules/nixos/fonts.nix
          ./modules/nixos/hyprland.nix
          ./modules/nixos/localization.nix
          ./modules/nixos/lsp.nix
          inputs.home-manager.nixosModules.default
          inputs.catppuccin.nixosModules.catppuccin
        ];
        system = "x86_64-linux";
      };
    };
}
