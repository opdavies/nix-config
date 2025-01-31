{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.features.desktop.thunar.enable = mkEnableOption "Enable thunar";

  config = mkIf config.features.desktop.thunar.enable {
    programs.thunar = {
      enable = true;

      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };

    environment.systemPackages = with pkgs; [ xfce.tumbler ];
  };
}
