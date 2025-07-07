{ pkgs, ... }:

with pkgs;

stdenv.mkDerivation {
  pname = "tmux-sessionizer";
  version = "unstable-2025-06-19";

  src = fetchFromGitHub {
    owner = "theprimeagen";
    repo = "tmux-sessionizer";
    rev = "7edf8211e36368c29ffc0d2c6d5d2d350b4d729b";
    sha256 = "sha256-4QGlq/cLbed7AZhQ3R1yH+44gmgp9gSzbiQft8X5NwU=";
  };

  buildInputs = [
    bash
    fzf
    tmux
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp tmux-sessionizer $out/bin/tmux-sessionizer
    chmod +x $out/bin/tmux-sessionizer
  '';

  # TODO: create another patch to sort results.
}
