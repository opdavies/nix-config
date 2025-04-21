{ pkgs, ... }:

with pkgs;

stdenv.mkDerivation {
  pname = "displayselect";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "lukesmithxyz";
    repo = "voidrice";
    rev = "master";
    sha256 = "sha256-9U1Do0w2oT5E6uZxSKoHAzbGbSLQRQlT65KcPGzwhW8=";
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
