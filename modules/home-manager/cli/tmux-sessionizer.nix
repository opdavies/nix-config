{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.cli.tmux-sessionizer;
in
{
  options.cli.tmux-sessionizer = {
    enable = mkEnableOption "Enable tmux-sessionizer";
    enableDmenuIntegration = mkEnableOption "Enable dmenu integration";

    searchPaths = mkOption {
      default = [ config.home.homeDirectory ];
      type = types.listOf types.str;
      description = "List of search paths for tmux-sessionizer to use.";
    };

    # TODO: add TS_EXTRA_SEARCH_PATHS.
    # TODO: add TS_MAX_DEPTH.
    # TODO: add TS_SESSION_COMMANDS once I figure out what they're for.
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      tmux-sessionizer
    ];

    home.file.".tmux-sessionizer".source = "${
      pkgs.writeShellApplication {
        name = ".tmux-sessionizer";

        runtimeInputs = with pkgs; [
          tmux
        ];

        text = ''
          set +o errexit
          set +o nounset

          if [[ "$PWD" == "${config.xdg.userDirs.extraConfig.XDG_REPOS_DIR}/os" || "$PWD" == "${config.xdg.userDirs.extraConfig.XDG_REPOS_DIR}/personal" || "$PWD" == "${config.xdg.userDirs.extraConfig.XDG_REPOS_DIR}/work"  ]]; then
            clear

            return
          fi

          tmux new-window -d -n scratch
          nvim .
          clear
        '';
      }
    }/bin/.tmux-sessionizer";

    xdg.configFile."tmux-sessionizer/tmux-sessionizer.conf".text = ''
      TS_SEARCH_PATHS=(${builtins.concatStringsSep " " cfg.searchPaths})
    '';
  };
}
