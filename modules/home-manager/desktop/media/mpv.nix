{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.features.desktop.media.mpv;
in
{
  options.features.desktop.media.mpv.enable = mkEnableOption "Enable mpv";

  config = mkIf cfg.enable {
    programs.mpv = {
      enable = true;

      # https://github.com/mpv-player/mpv/blob/master/etc/input.conf
      bindings = {
        "DOWN" = "add volume -5";
        "UP" = "add volume 5";
      };
    };
  };
}
