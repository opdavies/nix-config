{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.homeManagerModules.pocket-casts.enable = mkEnableOption "Enable Pocket Casts";

  config = mkIf config.homeManagerModules.pocket-casts.enable {
    home.packages = with pkgs; [ pocket-casts ];
  };
}
