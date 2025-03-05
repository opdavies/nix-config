{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.homeManagerModules.kdenlive.enable = mkEnableOption "Enable kdenlive";

  config = mkIf config.homeManagerModules.kdenlive.enable {
    home.packages = with pkgs; [ kdePackages.kdenlive ];
  };
}
