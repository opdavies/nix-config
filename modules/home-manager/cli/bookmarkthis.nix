{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib) mkEnableOption mkOption;

  cfg = config.cli.${name};
  name = "bookmarkthis";
in
{
  options.cli.${name} = {
    enable = mkEnableOption "Enable ${name}";

    snippetsFile = mkOption {
      default = "${config.xdg.dataHome}/snippets.txt";
      type = lib.types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        (pkgs.writeShellApplication {
          name = "bookmarkthis";

          text = ''
            message() {
              if command -v  ${lib.getExe libnotify} > /dev/null; then
                ${lib.getExe libnotify} "$1" "$2"
              else
                echo "$2"
              fi
            }

            main() {
              bookmark="$(xclip -o)"
              file="$SNIPPETS_FILE"

              if grep -q "^$bookmark$" "$file"; then
                message "Oops." "Already bookmarked." >&2

                exit 2
              fi

              echo "$bookmark" >> "$file"

              message "Bookmark added!" "$bookmark is now saved to the file."
            }

            main
          '';
        })
      ];

      sessionVariables = {
        SNIPPETS_FILE = cfg.snippetsFile;
      };
    };

    programs.zsh.zsh-abbr.abbreviations = lib.optionalAttrs (config.programs.zsh.enable) {
      "sn" = "${config.home.sessionVariables.EDITOR} $SNIPPETS_FILE";
    };
  };
}
