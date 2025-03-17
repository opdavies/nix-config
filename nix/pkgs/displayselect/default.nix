{ pkgs, ... }:

with pkgs;

stdenv.mkDerivation {
  pname = "displayselect";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "lukesmithxyz";
    repo = "voidrice";
    rev = "master";
    sha256 = "ZoEyircvifmAH7QqDpdDxhaHMdAfWtjZB6JiSvMBRVg=";
  };

  buildInputs = [
    bash
    xorg.xrandr
  ];

  patches = [ ./scaling.patch ];

  installPhase = ''
    mkdir -p $out/bin
    cp .local/bin/displayselect $out/bin
    chmod +x $out/bin/displayselect
  '';

  meta.mainProgram = "displayselect";
}
