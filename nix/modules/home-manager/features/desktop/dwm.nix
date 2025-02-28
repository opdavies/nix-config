{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.features.desktop.dwm.enable = mkEnableOption "Enable dwm";

  config = mkIf config.features.desktop.dwm.enable {
    home = {
      file.".xinitrc".text = ''
        systemctl --user import-environment DISPLAY

        autorandr --change

        copyq &

        poweralertd -s &

        systemctl --user start dwm-status &

        exec dwm
      '';

      packages = with pkgs; [
        dunst
        poweralertd
      ];
    };
  };
}
