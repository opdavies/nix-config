{ config, lib, ... }:

with lib;

let
  cfg = config.features.desktop.flameshot;
in
{
  options.features.desktop.flameshot.enable = mkEnableOption "Enable flameshot";

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
