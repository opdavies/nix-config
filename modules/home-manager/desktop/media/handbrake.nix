{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.desktop.media.handbrake;
in
{
  options.desktop.media.handbrake.enable = mkEnableOption "Enable handbrake";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      stable.handbrake
    ];
  };
}
