{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.features.desktop.media.handbrake;
in
{
  options.features.desktop.media.handbrake.enable = mkEnableOption "Enable handbrake";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      handbrake
    ];
  };
}
