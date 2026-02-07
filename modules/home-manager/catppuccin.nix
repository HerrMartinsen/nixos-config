{ ... }:

{
  services.swaync.enable = true;
  programs = {
    spotify-player.enable = true;
    hyprlock.enable = true;
    rofi.enable = true;

    yazi = {
      enable = true;
      settings = {
        linemode = "size";
      };
    };
    vscode.enable = true;
    # waybar.enable = true;
    # thunderbird.enable = true;
  };
  # gtk.enable = true;
  #  services.dunst.enable = true;
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
    # gtk.icon.enable = false;
  };
}
