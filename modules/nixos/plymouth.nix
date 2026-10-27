{ lib, pkgs, ... }:
{
  boot = {
    initrd = {
      systemd.enable = lib.mkDefault true;
      kernelModules = [ "i915" ];
    };
    plymouth = {
      enable = lib.mkDefault true;
      theme = "framework-penguin";
      themePackages = [ pkgs.framework-penguin ];
    };
    consoleLogLevel = lib.mkDefault 3;
    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];
  };
}
