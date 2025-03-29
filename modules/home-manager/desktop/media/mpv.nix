{ config, lib, ... }:

with lib;

{
  options.homeManagerModules.mpv.enable = mkEnableOption "Enable mpv media player";

  config = mkIf config.homeManagerModules.mpv.enable {
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
