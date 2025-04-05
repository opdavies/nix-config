{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./qutebrowser.nix
  ];
}
