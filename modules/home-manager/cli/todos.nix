{
  config,
  lib,
  pkgs,
  ...
}:

let
  name = "todos";
  cfg = config.features.cli.${name};

  inherit (lib) mkOption types;
in
{
  options.features.cli.${name} = {
    enable = lib.mkEnableOption "Enable ${name}";

    directory = mkOption {
      default = "${config.xdg.userDirs.documents}/todos";
      type = types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        todos-add
        todos-edit
      ];

      sessionVariables = {
        TODOS_DIRECTORY = cfg.directory;
      };
    };
  };
}
