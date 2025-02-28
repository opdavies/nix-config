{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
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
    zbar
  ];

  programs = {
    yazi.enable = true;
  };
}
