{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.features.cli.notes;
in
{
  options.features.cli.notes.enable = mkEnableOption "Enable notes";

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
