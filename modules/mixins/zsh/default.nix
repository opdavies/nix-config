{
  home-manager.users.opdavies =
    { config, pkgs, ... }:
    {
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;

        zsh-abbr = {
          enable = true;

          abbreviations = import ./abbreviations.nix;
          globalAbbreviations = import ./global-abbreviations.nix;
        };

        dotDir = ".config/zsh";

        shellAliases = (import ./aliases.nix { inherit config; });

        localVariables = {
          ABBR_SET_EXPANSION_CURSOR = 1;
        };

        initExtra = ''
          if [[ -z "$DISPLAY" ]] && [[ "$(tty)" == "/dev/tty1" ]]; then
            exec startx &>/dev/null
          fi

          background() {
            for ((i=2;i<=$#;i++)); do
              ''${@[1]} ''${@[$i]} &> /dev/null &
            done
          }

          # suffix
          alias -s gz="tar -tf"
          alias -s {html,HTML}="background firefox"
          alias -s {jpg,JPG,png,PNG}="background okular"
          alias -s {pdf,PDF}="background okular"
          alias -s {zip,ZIP}="unzip -l"

          git() {
            case "$1" in
              clone)
                shift

                local repo_url="$1"
                local repo_path="''${2:-}"

                if [ -n "$TARGET_DIR" ]; then
                  command git clone "$repo_url" "$repo_path"
                else
                  command git clone "$repo_url"
                  repo_path=$(basename "$repo_url" .git)
                fi

                ${pkgs.tmux-sessionizer}/bin/tmux-sessionizer "$repo_path"
                ;;

              root)
                shift

                local ROOT="$(${pkgs.git}/bin/git rev-parse --show-toplevel 2> /dev/null || echo -n .)"

                if [[ $# == 0 ]]; then
                  cd "''${ROOT}"
                else
                  (cd "''${ROOT}" && eval "''${@}")
                fi
                ;;

              *)
                ${pkgs.git}/bin/git "''${@}"
                ;;
            esac
          }

          mbsync() {
            ${pkgs.isync}/bin/mbsync --config "${config.xdg.configHome}/isync/mbsyncrc" "''${@}"
          }

          ttyper() {
            command ${pkgs.ttyper}/bin/ttyper --language english1000 --words 50 "''${@}"
          }

          yt-dlp() {
            command yt-dlp --paths ~/Videos "$@"
          }

          bindkey -s ^f "tmux-sessionizer\n"
          bindkey -s ^v "nvim\n"

          setopt auto_cd
          setopt auto_pushd
          setopt pushd_ignore_dups
          setopt pushdminus
        '';
      };
    };
}
