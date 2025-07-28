{ lib, ... }:

{
  flake.modules.homeManager.gui =
    { config, pkgs, ... }:
    {
      options.programs.bookmarkthis.snippetsFile = lib.mkOption {
        default = "${config.xdg.dataHome}/snippets.txt";
        type = lib.types.str;
      };

      config = {
        home = {
          packages = [
            (pkgs.writeShellApplication {
              name = "bookmarkthis";

              text = ''
                message() {
                  if command -v  ${lib.getExe pkgs.libnotify} > /dev/null; then
                    ${lib.getExe pkgs.libnotify} "$1" "$2"
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
            SNIPPETS_FILE = config.programs.bookmarkthis.snippetsFile;
          };
        };

        programs.zsh.zsh-abbr.abbreviations = lib.optionalAttrs (config.programs.zsh.enable) {
          "sn" = "${config.home.sessionVariables.EDITOR} $SNIPPETS_FILE";
        };
      };
    };
}
