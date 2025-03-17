{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.homeManagerModules.tmux-sessionizer.enable = mkEnableOption "Enable tmux-sessionizer";

  config = mkIf config.homeManagerModules.tmux-sessionizer.enable {
    home.packages = with pkgs; [ tmux-sessionizer ];

    home.file."${config.xdg.configHome}/tmux-sessionizer/default".source = "${
      pkgs.writeShellApplication {
        name = ".tmux-sessionizer";

        runtimeInputs = with pkgs; [
          tmux
        ];

        text = ''
          set +o errexit
          set +o nounset

          if [[ "$PWD" == "$XDG_REPOS_DIR/os" || "$PWD" == "$XDG_REPOS_DIR/personal" ]]; then
            clear

            return
          fi

          tmux new-window -d -n shell
          nvim
          clear
        '';
      }
    }/bin/.tmux-sessionizer";
  };
}
