{ pkgs }:
pkgs.symlinkJoin {
	name = "spotify-wayland";
	paths = [pkgs.spotify];
	buildInputs = [pkgs.makeWrapper];
	postBuild = ''
		wrapProgram $out/bin/spotify --add-flags --enable-features=UseOzonePlatform --add-flags --ozone-platform=wayland
	'';
}
