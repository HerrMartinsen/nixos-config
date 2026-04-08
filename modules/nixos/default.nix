{ config, lib, ... }:
let
  p = config.my.modules.profile;
in
{
  options.my.modules.profile = lib.mkOption {
    type = lib.types.enum [
      "yoga"
      "default"
    ];
    default = "default";
  };
  config = {
    my.modules.office.enable = (p == "yoga");
    my.overlays.spotify-wayland.enable = (p == "yoga");
  };
  imports = [
    ./fonts.nix
    ./localization.nix
    ./networking.nix
    ./office.nix
    ./spotify-wayland.nix
    ./ssh.nix
    ./store.nix
  ];
}
