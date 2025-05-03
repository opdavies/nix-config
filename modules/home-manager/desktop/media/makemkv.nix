{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.desktop.media.makemkv;
in
{
  options.desktop.media.makemkv.enable = mkEnableOption "Enable makemkv";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      makemkv
    ];
  };
}
