{ pkgs, ... }:

{
  imports = [
    ./qutebrowser.nix
  ];

  home.packages = with pkgs; [
    build-glove80
    gscan2pdf
    kdePackages.okular
    meslo-lg
    obs-studio
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
