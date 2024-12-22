{ pkgs, ... }:

{
  fonts = {
    fontconfig = {
      enable = true;
    };

    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.meslo-lg
      nerd-fonts.terminess-ttf
    ];
  };
}
