{
  flake.modules.homeManager.gui =
    { config, ... }:
    {
      services.flameshot.settings.General = {
        disabledTrayIcon = false;
        saveAfterCopy = true;
        savePath = "${config.xdg.userDirs.pictures}/Screenshots";
        showHelp = false;
        uiColor = "#60a5fa";
      };
    };
}
