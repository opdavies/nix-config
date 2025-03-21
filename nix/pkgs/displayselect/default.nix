{ pkgs, ... }:

with pkgs;

stdenv.mkDerivation {
  pname = "displayselect";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "lukesmithxyz";
    repo = "voidrice";
    rev = "master";
    sha256 = "u4iy2p9i5ORLHcKmAOHVJNaKfYbt+SYUYKblgsRevN8=";
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
