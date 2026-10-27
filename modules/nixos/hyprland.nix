{ pkgs, inputs, ... }:

{
  services.displayManager.noctalia-greeter = {
    enable = true;
    package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
  programs.hyprland = {
    withUWSM = true;
    xwayland.enable = true;
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    kitty
    # rofi
    pavucontrol
    # waybar
    libnotify
    # hyprpaper
    brightnessctl
    networkmanagerapplet
    xdg-desktop-portal-gtk
    hyprpolkitagent
    wl-clipboard
    hyprpicker
    # hyprlock
    # hypridle
    # wlogout
    grimblast
    ntfs3g
    udiskie
    hyprmon
  ];

}
