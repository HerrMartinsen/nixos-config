{ lib, pkgs, ... }:
{
  networking.networkmanager.enable = lib.mkDefault true;
  hardware.bluetooth.enable = lib.mkDefault true;
  services = {
    power-profiles-daemon.enable = lib.mkDefault true;
    upower.enable = lib.mkDefault true;
  };
  environment.systemPackages = with pkgs; [
    evtest
  ];

}
