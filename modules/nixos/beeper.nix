{ pkgs }:
pkgs.symlinkJoin {
	name = "beeper-wayland";
	paths = [pkgs.beeper];
	buildInputs = [pkgs.makeWrapper];
	postBuild = ''
		wrapProgram $out/bin/beeper --add-flags --enable-features=UseOzonePlatform --add-flags --ozone-platform=wayland
	'';
}
