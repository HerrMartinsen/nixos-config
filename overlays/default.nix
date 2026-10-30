{ inputs, ... }:
{
  nixpkgs.overlays = [
    (import ./packages.nix)
    (final: prev: {
      stable = import inputs.nixpkgs-stable {
        system = prev.stdenv.hostPlatform.system;
        config = prev.config;
      };
    })
    inputs.helix.overlays.default
    (import ./helix-perl-fix.nix)
  ];
}
