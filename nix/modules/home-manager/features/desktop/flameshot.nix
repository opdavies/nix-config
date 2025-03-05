{
  config,
  lib,
  username,
  ...
}:

with lib;

{
  options.homeManagerModules.flameshot.enable = mkEnableOption "Enable flameshot";

  config = mkIf config.homeManagerModules.flameshot.enable {
    services.flameshot = {
      enable = true;

      settings = {
        General = {
          disabledTrayIcon = false;
          saveAfterCopy = true;
          savePath = "/home/${username}/Pictures/Screenshots";
          showHelp = false;
          uiColor = "#60a5fa";
        };
      };
    };
  };
}
