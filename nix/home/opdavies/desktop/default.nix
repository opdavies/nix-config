{ pkgs, ... }:

{
  imports = [
    ./qutebrowser.nix
  ];

  home.packages = with pkgs; [
    build-glove80
    gscan2pdf
    meslo-lg
    obs-studio
    okular
    pamixer
    pavucontrol
    xcape
    xsel
  ];
}
