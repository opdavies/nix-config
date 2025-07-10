{ pkgs }:

pkgs.writeShellApplication {
  name = "create-script";

  text = ''
    cat > "$1" << EOF
    #!/usr/bin/env bash

    set -o errexit
    set -o nounset
    set -o pipefail


    EOF

    chmod +x "$1"

    $EDITOR "$1";
  '';
}
