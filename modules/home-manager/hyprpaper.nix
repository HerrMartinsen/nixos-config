{ ... }:
{
  services.hyprpaper = {
    enable = false;
    settings = {
      wallpaper = {
        monitor = "";
        path = "~/nixos-config/img/wallpaper";
        timeout = 1800;
      };
    };
  };
}
