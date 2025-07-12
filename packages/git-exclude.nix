{ pkgs }:

pkgs.writeShellApplication {
  name = "git-exclude";

  runtimeInputs = with pkgs; [ git ];

  text = ''
    # Based on https://github.com/jfly/snow/blob/fb727b39736666f54908f4dc7c83dd6284607c5a/machines/pattern/homies/bin/git-exclude.

    root=$(git rev-parse --show-toplevel)
    rel=$(realpath --relative-to "$root" .)

    # For some reason, ignore rules like "./.envrc" don't seem to work, but
    # "/.envrc" does. :shrug:
    if [ "$rel" = "." ]; then
      rel=""
    fi

    for item in "$@"; do
      echo "''${rel}/$item" >> "$root/.git/info/exclude"
    done
  '';
}
