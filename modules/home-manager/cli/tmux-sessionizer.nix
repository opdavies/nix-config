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

    directories = mkOption {
      default = [ config.home.homeDirectory ];
      type = types.listOf types.str;
      description = "List of directories for tmux-sessionizer to use.";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      tmux-sessionizer
    ];

    xdg.configFile = {
      "tmux-sessionizer/default".source = "${
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

      "tmux-sessionizer/directories".text = builtins.concatStringsSep "\n" cfg.directories;
    };
  };
}
