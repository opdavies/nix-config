{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.homeManagerModules.cli.tmux-sessionizer;
in
{
  options.homeManagerModules.cli.tmux-sessionizer.enable = mkEnableOption "Enable tmux-sessionizer";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      tmux-sessionizer
    ];

    xdg.configFile."tmux-sessionizer/default".source = "${
      pkgs.writeShellApplication {
        name = ".tmux-sessionizer";

        runtimeInputs = with pkgs; [
          tmux
        ];

        text = ''
          set +o errexit
          set +o nounset

          if [[ "$PWD" == "${config.xdg.userDirs.extraConfig.XDG_REPOS_DIR}/os" || "$PWD" == "${config.xdg.userDirs.extraConfig.XDG_REPOS_DIR}/personal" ]]; then
            clear

            return
          fi

          tmux new-window -d -n scratch
          nvim .
          clear
        '';
      }
    }/bin/.tmux-sessionizer";
  };
}
