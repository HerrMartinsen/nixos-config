{ pkgs, ... }: {
  programs.yubikey-manager.enable = true;
  environment.systemPackages = with pkgs; [
    yubioath-flutter
  ];
}
