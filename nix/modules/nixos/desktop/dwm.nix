{
  config,
  lib,
  pkgs,
  self,
  ...
}:

with lib;

{
  options.nixosModules.dwm.enable = mkEnableOption "Enable dwm";

  config = mkIf config.nixosModules.dwm.enable {
    services = {
      dwm-status = {
        enable = true;

        order = [
          "audio"
          "battery"
          "network"
          "time"
        ];
      };

      xserver = {
        displayManager.startx.enable = true;
        windowManager.dwm.enable = true;
      };
    };

    systemd.user.services.dwm-status.serviceConfig.Restart = "on-failure";

    environment.systemPackages = with pkgs; [
      dmenu
      dmenu-bluetooth
      networkmanager_dmenu
      slock
      xdotool
    ];
  };
}
