{ pkgs, ... }:

with pkgs;

stdenv.mkDerivation {
  pname = "displayselect";
  version = "unstable-2024-05-11";

  src = fetchFromGitHub {
    owner = "lukesmithxyz";
    repo = "voidrice";
    rev = "97687287bdfd332398b82a196b5f1feaec73f1d7";
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
