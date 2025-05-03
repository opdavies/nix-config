{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.desktop.fonts;
in
{
  options.desktop.fonts.enable = mkEnableOption "Enable fonts";

  config = mkIf cfg.enable {
    fonts = {
      fontconfig = {
        enable = true;
      };

      packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        nerd-fonts.meslo-lg
        terminus_font
        terminus_font_ttf
      ];
    };
  };
}
