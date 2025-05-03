{ config, lib, ... }:

with lib;

let
  cfg = config.desktop.flameshot;
in
{
  options.desktop.flameshot.enable = mkEnableOption "Enable flameshot";

  config = mkIf cfg.enable {
    services.flameshot = {
      enable = true;

      settings = {
        General = {
          disabledTrayIcon = false;
          saveAfterCopy = true;
          savePath = "${config.xdg.userDirs.pictures}/Screenshots";
          showHelp = false;
          uiColor = "#60a5fa";
        };
      };
    };
  };
}
