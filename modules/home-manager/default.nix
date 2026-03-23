{
  osConfig,
  config,
  lib,
  ...
}:
let
  hmp = config.my.homeManager.profile;
in
{
  options.my.homeManager.profile = lib.mkOption {
    type = lib.types.enum [
      "server"
      "desktop"
    ];
  };
  config = {
    my.homeManager = {
      # hyprland.enable = hmp == "desktop";
      # catppuccin.enable = true;
      # helix.enable = true;
      # kitty.enable = hmp == "desktop";
      # waybar.enable = hmp == "desktop";
      vscode.enable = hmp == "desktop";
      # clipboard.enable = hmp == "desktop";
    };
    home = {
      username = "martin";
      homeDirectory = "/home/martin";
      stateVersion = "25.05";
      packages = [ ];
    };
    nixpkgs = {
      overlays = osConfig.nixpkgs.overlays;
      config.allowUnfree = true;
    };
    programs.home-manager.enable = true;

  };
  imports = [
    ./hyprland.nix
    ./hyprpaper.nix
    ./catppuccin.nix
    #./firefox.nix
    ./helix.nix
    ./kitty.nix
    ./waybar.nix
    ./vscode.nix
    ./clipboard.nix
  ];
}
