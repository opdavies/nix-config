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

  patches = [
    (fetchpatch {
      name = "Sort directories alphabetically #23";
      sha256 = "sha256-AtaOlV2JSeR0BmDsfuv8ZFbu5G0vz4RdUPY4ZF4UqQc=";
      url = "https://patch-diff.githubusercontent.com/raw/ThePrimeagen/tmux-sessionizer/pull/23.patch";
    })

    ./shorten-paths.patch
  ];
}
