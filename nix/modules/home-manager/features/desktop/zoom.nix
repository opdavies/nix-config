{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.homeManagerModules.zoom.enable = mkEnableOption "Enable zoom";

  config = mkIf config.homeManagerModules.zoom.enable {
    home.packages = with pkgs; [ zoom-us ];
  };
}
