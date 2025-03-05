{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.homeManagerModules.gimp.enable = mkEnableOption "Enable gimp";

  config = mkIf config.homeManagerModules.gimp.enable {
    home.packages = with pkgs; [ gimp ];
  };
}
