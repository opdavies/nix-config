{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.homeManagerModules.desktop.media.makemkv;
in
{
  options.homeManagerModules.desktop.media.makemkv.enable = mkEnableOption "Enable makemkv";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      makemkv
    ];
  };
}
