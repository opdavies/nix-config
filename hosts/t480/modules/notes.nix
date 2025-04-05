{
  home-manager.users.opdavies =
    { config, pkgs, ... }:
    {
      xdg = {
        enable = true;
        userDirs.enable = true;
      };

      home = {
        packages = with pkgs; [ notes ];

        sessionVariables = {
          NOTES_DIRECTORY = "${config.xdg.userDirs.documents}/wiki/notes";
        };
      };
    };
}
