{
  flake.modules.homeManager.base =
    { config, pkgs, ... }:
    {
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
    };
}
