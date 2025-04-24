{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.homeManagerModules.desktop.media.handbrake;
in
{
  options.homeManagerModules.desktop.media.handbrake.enable = mkEnableOption "Enable handbrake";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      handbrake
    ];
  };
}
