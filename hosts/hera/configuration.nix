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
  # dedicated passphrase-less key for nix-daemon (root) on yoga to use hera as a remote builder
  users.users.martin.openssh.authorizedKeys.keyFiles = [
    ../../keys/id_ed25519_yoga_remote_builder.pub
  ];

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
