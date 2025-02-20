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
    home.file.".xinitrc".text = ''
      systemctl --user import-environment DISPLAY

      ${pkgs.autorandr}/bin/autorandr --change

      ${pkgs.copyq}/bin/copyq &

      systemctl --user start dwm-status &

      exec ${pkgs.dwm}/bin/dwm
    '';
  };
}
