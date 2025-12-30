{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fprintd
  ];

  services.fprintd = {
    enable = true;
    tod.enable = true;
    tod.driver = pkgs.libfprint-2-tod1-goodix;
  };
  # enable PAM fingerprint for display manager, lockscreen and sudo
  security.pam.services = {
    sddm.fprintAuth = true;
    hyprlock = {};        # creates /etc/pam.d/hyprlock
    sudo.fprintAuth = true;
    polkit-1.fprintAuth = true;
  };
}
