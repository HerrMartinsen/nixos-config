{ ... }:

{
  home.pointerCursor.hyprcursor.enable = true;
  services.swaync.enable = true;
  programs = {
    spotify-player.enable = true;
    hyprlock.enable = true;
    rofi.enable = true;
    delta.enable = true;

    yazi = {
      enable = true;
      settings = {
        linemode = "size";
      };
    };
    # waybar.enable = true;
    # thunderbird.enable = true;
  };
  # gtk.enable = true;
  #  services.dunst.enable = true;
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
    cursors.enable = true;
    # gtk.icon.enable = false;
  };
}
