{
  home-manager.users.opdavies =
    { config, ... }:
    {
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
