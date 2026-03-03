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
    allowDuplicates = false;
    historySize = 200;
    imageDisplay.type = "kitty";
  };
  xdg.configFile."clipse/config.json".source = lib.mkForce (
    json.generate "clipse-config" {
      allowDuplicates = config.services.clipse.allowDuplicates;
      historyFile = "clipboard_history.json";
      maxHistory = config.services.clipse.historySize;
      logFile = "clipse.log";
      themeFile = "custom_theme.json";
      tempDir = "tmp_files";

      keyBindings = config.services.clipse.keyBindings;
      imageDisplay = config.services.clipse.imageDisplay;

      excludedApps = [
        "Bitwarden"
      ];
    }
  );
}
