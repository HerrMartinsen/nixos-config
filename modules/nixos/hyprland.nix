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
  environment.systemPackages = with pkgs; [
    kitty
    rofi
    pavucontrol
    waybar
    libnotify
    hyprpaper
    brightnessctl
    networkmanagerapplet
    xdg-desktop-portal-gtk
    hyprpolkitagent
    wl-clipboard
    hyprpicker
    hyprlock
    hypridle
    wlogout
    grimblast
    ntfs3g
    udiskie
  ];

}
