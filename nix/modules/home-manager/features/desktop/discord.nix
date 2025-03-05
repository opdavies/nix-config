{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.homeManagerModules.discord.enable = mkEnableOption "Enable Discord";

  config = mkIf config.homeManagerModules.discord.enable {
    home.packages = with pkgs; [ discord ];
  };
}
