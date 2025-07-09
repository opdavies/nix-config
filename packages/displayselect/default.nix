{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  pname = "displayselect";
  version = "unstable-2024-05-11";

  src = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/lukesmithxyz/voidrice/97687287bdfd332398b82a196b5f1feaec73f1d7/.local/bin/displayselect";
    sha256 = "sha256:11r561pfhb48a3xmi42zzvpljahnwlfad9rz8qmmp64dhz1f2vp0";
  };

  dontUnpack = true;

  buildInputs = with pkgs; [
    bash
    xorg.xrandr
  ];

  prePatch = ''
    cp $src displayselect
  '';

  patches = [ ./scaling.patch ];

  installPhase = ''
    mkdir -p $out/bin
    cp displayselect $out/bin
    chmod +x $out/bin/displayselect
  '';

  meta.mainProgram = "displayselect";
}
