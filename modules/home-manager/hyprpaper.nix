{ ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = {
        monitor = "";
        path = "~/nixos-config/img/wallpaper";
        timeout = 1800;
      };
    };
  };
}
