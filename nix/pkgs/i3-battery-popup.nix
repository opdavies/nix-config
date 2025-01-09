{ pkgs, ... }:

pkgs.stdenv.mkDerivation rec {
  pname = "i3-battery-popop";
  version = "1.1.1";

  src = pkgs.fetchFromGitHub {
    owner = "rjekker";
    repo = "i3-battery-popup";
    rev = "v${version}";
    sha256 = "s6jZCkB0Z8dtnBG2p1NJIUY1fV4urEp4w6wFzxFNlqg=";
  };

  buildInputs = with pkgs; [ bash ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src/i3-battery-popup $out/bin/i3-battery-popup
    chmod +x $out/bin/i3-battery-popup
  '';
}
