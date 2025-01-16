{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    zsh-abbr = {
      enable = true;

      abbreviations = import ./zsh/abbreviations.nix;
    };

    cdpath = [ "~/Code" ];
    dotDir = ".config/zsh";

    shellAliases = (import ./zsh/aliases.nix);

    localVariables = {
      ABBR_SET_EXPANSION_CURSOR = 1;
    };

    initExtra = ''
      # suffix
      alias -s gz="tar -tf"
      alias -s {html,HTML}="background firefox"
      alias -s {jpg,JPG,png,PNG}="background okular"
      alias -s {pdf,PDF}="background okular"
      alias -s {zip,ZIP}="unzip -l"

      git() {
        if [[ "''${1}" == "root" ]]; then
          shift

          local ROOT="$(${pkgs.git}/bin/git rev-parse --show-toplevel 2> /dev/null || echo -n .)"

          if [[ $# == 0 ]]; then
            cd "''${ROOT}"
          else
            (cd "''${ROOT}" && eval "''${@}")
          fi
        else
          ${pkgs.git}/bin/git "''${@}"
        fi
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
}
