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
      file."${config.home.sessionVariables.XINITRC}".text = ''
        systemctl --user import-environment DISPLAY

        poweralertd -s &

        setbg &

        systemctl --user start dwm-status &

        exec dwm
      '';

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
