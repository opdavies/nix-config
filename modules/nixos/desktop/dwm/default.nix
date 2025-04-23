{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.nixosModules.desktop.dwm;
in
{
  options.nixosModules.desktop.dwm.enable = mkEnableOption "Enable dwm";

  config = mkIf cfg.enable {
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

      xserver.windowManager.dwm.enable = true;
    };

    systemd.user.services.dwm-status.serviceConfig.Restart = "on-failure";

    environment.systemPackages = with pkgs; [
      dmenu
      dmenu-bluetooth
      dunst
      networkmanager_dmenu
      poweralertd
      slock
      xdotool
      xwallpaper
    ];

    home-manager.users.opdavies =
      { config, ... }:
      {
        home = {
          file."${config.home.sessionVariables.XINITRC}".source = ./xinitrc;

          sessionVariables = {
            XINITRC = "${config.xdg.configHome}/X11/xinitrc";
          };
        };
      };
  };
}
