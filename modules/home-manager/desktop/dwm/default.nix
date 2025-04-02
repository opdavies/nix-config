{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.homeManagerModules.dwm.enable = mkEnableOption "Enable dwm";

  config = mkIf config.homeManagerModules.dwm.enable {
    home = {
      file."${config.home.sessionVariables.XINITRC}".source = ./xinitrc;

      sessionVariables = {
        XINITRC = "${config.xdg.configHome}/X11/xinitrc";
      };

      packages = with pkgs; [
        dunst
        poweralertd
        xwallpaper
      ];
    };
  };
}
