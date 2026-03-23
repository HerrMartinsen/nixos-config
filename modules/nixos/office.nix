{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.my.modules.office.enable = lib.mkEnableOption "office documents edit";
  config = lib.mkIf config.my.modules.office.enable {
    environment.systemPackages = with pkgs; [
      #office programms
      libreoffice-qt
      hunspell
      hunspellDicts.de_DE
      hunspellDicts.en_US

      #file explorer
      kdePackages.dolphin
      nautilus

      #pdf viewer
      atril
    ];
  };
}
