{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.features.desktop.zoom.enable = mkEnableOption "Enable zoom";

  config = mkIf config.features.desktop.zoom.enable {
    home.packages = with pkgs; [ zoom-us ];
  };
}
