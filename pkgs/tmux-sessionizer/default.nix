{ pkgs, ... }:

with pkgs;

stdenv.mkDerivation {
  pname = "tmux-sessionizer";
  version = "unstable-2024-10-30";

  src = fetchFromGitHub {
    owner = "theprimeagen";
    repo = "tmux-sessionizer";
    rev = "6ebd16e2e30a8c0ebd77f0c2ce18cb46db8397fa";
    sha256 = "bZXt9TyMU1Ed/WR0/ahMQ4oyIi6yXLKnXKYPPNBt/s4=";
  };

  buildInputs = [
    bash
    fzf
    tmux
  ];

  patches = [
    ./move-default-script.patch

    (fetchpatch {
      name = "feat: Made folders more dynamic";
      url = "https://patch-diff.githubusercontent.com/raw/ThePrimeagen/tmux-sessionizer/pull/2.patch";
      sha256 = "sha256-4/4rzve49T3FHnl9WWUPJVcb0NQojMQjIVnEZGwVAsY=";
    })

    ./shorten-suggested-paths.patch
    ./sort-suggestions.patch
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp tmux-sessionizer $out/bin/tmux-sessionizer
    chmod +x $out/bin/tmux-sessionizer
  '';
}
