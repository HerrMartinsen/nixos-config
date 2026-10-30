{
  config,
  lib,
  pkgs,
  ...
}:
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
    my.modules.office.enable = lib.mkDefault (p == "yoga");
    my.overlays.spotify-wayland.enable = lib.mkDefault (p == "yoga");
    environment.systemPackages = with pkgs; [
      htop
      btop
      unzip
      wget
      yazi
      bat
    ];

  };
  imports = [
    ./fonts.nix
    ./localization.nix
    ./networking.nix
    ./noctalia.nix
    ./office.nix
    ./plymouth.nix
    ./spotify-wayland.nix
    ./ssh.nix
    ./store.nix
    ./yubikey.nix
  ];
}
