{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.homeManagerModules.notes;
in
{
  options.homeManagerModules.notes = {
    enable = mkEnableOption "Enable notes";

    directory = mkOption {
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [ notes ];

      sessionVariables = {
        NOTES_DIRECTORY = "${cfg.directory}";
      };
    };
  };

}
