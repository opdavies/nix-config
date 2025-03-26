{ pkgs, ... }:

with pkgs;

stdenv.mkDerivation {
  pname = "tmux-sessionizer";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "theprimeagen";
    repo = "tmux-sessionizer";
    rev = "master";
    sha256 = "bZXt9TyMU1Ed/WR0/ahMQ4oyIi6yXLKnXKYPPNBt/s4=";
  };

  buildInputs = [
    bash
    fzf
    tmux
  ];

  patches = [
    ./move-default-script.patch
    ./add-tmux-file.patch
    ./configure-directories.patch
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp tmux-sessionizer $out/bin/tmux-sessionizer
    chmod +x $out/bin/tmux-sessionizer
  '';
}
