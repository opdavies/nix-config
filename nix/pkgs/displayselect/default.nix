{ pkgs, ... }:

with pkgs;

stdenv.mkDerivation {
  pname = "displayselect";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "lukesmithxyz";
    repo = "voidrice";
    rev = "master";
    sha256 = "BybEijy1zH+UNyCgWnenmcazwE8B3PXGc+Cl0FO/n3o=";
  };

  buildInputs = [
    bash
    bc
    xorg.xrandr
  ];

  patches = [
    ./remove-setbg.patch
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp .local/bin/displayselect $out/bin
    chmod +x $out/bin/displayselect
  '';
}
