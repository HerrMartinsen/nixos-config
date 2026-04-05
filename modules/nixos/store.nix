{ ... }:
{
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 10d";
    };
    settings.auto-optimise-store = true;
  };
}
