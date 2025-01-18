{ pkgs, ... }:

pkgs.stdenv.mkDerivation rec {
  pname = "tmux-sessonizer";
  version = "0.1.0";

  src = pkgs.fetchFromGitHub {
    owner = "theprimeagen";
    repo = "tmux-sessionizer";
    rev = "master";
    sha256 = "bZXt9TyMU1Ed/WR0/ahMQ4oyIi6yXLKnXKYPPNBt/s4=";
  };

  buildInputs = with pkgs; [
    bash
    fzf
    tmux
  ];

  patches = [ ./configure-directories.patch ];

  installPhase = ''
    mkdir -p $out/bin
    cp tmux-sessionizer $out/bin/tmux-sessionizer
    chmod +x $out/bin/tmux-sessionizer
  '';
}
