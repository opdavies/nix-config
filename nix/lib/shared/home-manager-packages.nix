{
  headless,
  pkgs,
  username,
  ...
}:
let
  php = pkgs.php82;
  phpPackages = pkgs.php82Packages;

  inherit (pkgs) writeShellApplication;

  _timer = writeShellApplication (import ./scripts/_timer.nix);
  deliver = writeShellApplication (import ./scripts/deliver.nix { inherit pkgs; });
  export-video-list = writeShellApplication (
    import ./scripts/export-video-list.nix { inherit pkgs username; }
  );
  run = writeShellApplication (import ./scripts/run.nix { inherit pkgs; });
  timer = writeShellApplication (import ./scripts/timer.nix);
in
with pkgs;
[
  cachix
  delta
  devenv
  doppler
  entr
  gcc
  git
  git-crypt
  gnupg
  go
  inotify-tools
  jq
  killall
  lua
  mob
  php
  phpPackages.composer
  pv
  simple-http-server
  sshs
  tldr
  tree
  tree-sitter
  unzip
  w3m
  watchexec
  wget
  xclip
  xdg-utils
  zbar

  # Scripts.
  deliver
  run
]
++ pkgs.lib.optionals (!headless) [
  # Scripts.
  _timer
  export-video-list
  timer
]
