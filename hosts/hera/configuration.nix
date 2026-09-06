{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # martin must be trusted for yoga to use hera as a remote build machine
  nix.settings.trusted-users = [ "martin" ];

  users.users.martin = {
    isNormalUser = true;
    description = "Martin";
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    htop
    wget
    git
    helix
  ];

  my.modules.ssh.profile = "server";

  # Confirm against `nixos-version` on the install ISO before installing.
  system.stateVersion = "25.11";
}
