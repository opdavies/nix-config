{
  config,
  lib,
  pkgs,
  self,
  ...
}:

with lib;

{
  options.features.desktop.dwm.enable = mkEnableOption "Enable dwm";

  config = mkIf config.features.desktop.dwm.enable {
    services = {
      dwm-status = {
        enable = true;

        order = [
          "audio"
          "backlight"
          "battery"
          "cpu_load"
          "network"
          "time"
        ];
      };

      xserver.windowManager.dwm.enable = true;
    };

    systemd.user.services.dwm-status.serviceConfig.Restart = "on-failure";

    environment.systemPackages = with pkgs; [
      dmenu
      dmenu-bluetooth
      networkmanager_dmenu
      st
      xdotool
    ];
  };
}
