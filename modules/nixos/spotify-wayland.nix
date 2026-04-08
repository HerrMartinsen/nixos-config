{
  lib,
  config,
  ...
}:
{
  options.my.overlays.spotify-wayland.enable = lib.mkEnableOption "spotify wayland overlay";
  config = lib.mkIf config.my.overlays.spotify-wayland.enable {
    nixpkgs.overlays = [
      (final: prev: {
        spotify = prev.symlinkJoin {
          name = "spotify-wayland";
          paths = [ prev.spotify ];
          nativeBuildInputs = [ final.makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/spotify \
              --add-flags "--enable-features=UseOzonePlatform" \
              --add-flags "--ozone-platform=wayland"
          '';
        };
      })
    ];
  };
}
