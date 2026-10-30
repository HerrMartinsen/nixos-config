{
  stdenvNoCC,
  fetchFromGitHub,
  lib,
  nixos-icons,
  watermark ? "${nixos-icons}/share/icons/hicolor/128x128/apps/nix-snowflake.png",
}:

stdenvNoCC.mkDerivation {
  pname = "framework-penguin";
  version = "0-unstable";

  src = fetchFromGitHub {
    owner = "ygurin";
    repo = "framework-penguin";
    rev = "13c0295d65b0ce45116decdc69fadf4679c7d9a7";
    hash = "sha256-GrfUZyhyWXfJHSjFxv7LA7OQmiRaWEyvVzR16RO2PUM=";
  };

  postPatch = ''
    rm README.md LICENSE LICENSES.md
  '';

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/plymouth/themes/framework-penguin
    cp -r * $out/share/plymouth/themes/framework-penguin
    install -Dm644 ${watermark} $out/share/plymouth/themes/framework-penguin/watermark.png
    find $out/share/plymouth/themes/ -name \*.plymouth -exec sed -i "s@/usr/@$out/@" {} \;
    runHook postInstall
  '';
}
