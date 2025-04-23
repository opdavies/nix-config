{ config, lib, ... }:

with lib;

let
  cfg = config.homeManagerModules.desktop.flameshot;
in
{
  options.homeManagerModules.desktop.flameshot.enable = mkEnableOption "Enable flameshot";

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
