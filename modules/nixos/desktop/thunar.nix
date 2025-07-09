{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.features.desktop.thunar;
in
{
  options.features.desktop.thunar.enable = mkEnableOption "Enable thunar";

  config = mkIf cfg.enable {
    programs.thunar = {
      enable = true;

      plugins = with pkgs.xfce; [
        thunar-archive-plugin
      ];
    };

    environment.systemPackages = with pkgs; [ xfce.tumbler ];
  };
}
