{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.features.desktop.media.makemkv;
in
{
  options.features.desktop.media.makemkv.enable = mkEnableOption "Enable makemkv";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      makemkv
    ];
  };
}
