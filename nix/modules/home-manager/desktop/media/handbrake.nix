{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.homeManagerModules.handbrake.enable = mkEnableOption "Enable handbrake";

  config = mkIf config.homeManagerModules.handbrake.enable {
    home.packages = with pkgs; [ handbrake ];
  };
}
