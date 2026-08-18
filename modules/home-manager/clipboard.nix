{
  pkgs,
  lib,
  config,
  ...
}:
let
  json = pkgs.formats.json { };
in
{
  services.clipse = {
    enable = true;
    settings = {
      allowDuplicates = false;
      historySize = 200;
      imageDisplay.type = "kitty";
      keyBindings = { };
    };
  };
  xdg.configFile."clipse/config.json".source = lib.mkForce (
    json.generate "clipse-config" {
      allowDuplicates = config.services.clipse.settings.allowDuplicates;
      historyFile = "clipboard_history.json";
      maxHistory = config.services.clipse.settings.historySize;
      logFile = "clipse.log";
      themeFile = "custom_theme.json";
      tempDir = "tmp_files";

      keyBindings = config.services.clipse.settings.keyBindings;
      imageDisplay = config.services.clipse.settings.imageDisplay;

      excludedApps = [
        "Bitwarden"
      ];
    }
  );
}
