{ pkgs, inputs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
  };
  programs.hyprland = {
    withUWSM = true;
    xwayland.enable = true;
    enable = true;
  };

}
