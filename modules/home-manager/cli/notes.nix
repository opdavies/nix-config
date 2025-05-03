{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.cli.notes;
in
{
  options.cli.notes.enable = mkEnableOption "Enable notes";

  config = mkIf cfg.enable {
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
