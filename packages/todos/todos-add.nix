{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "todos-add";

  text = ''
    TODOS_DIRECTORY="''${TODOS_DIRECTORY:-"$XDG_DOCUMENTS_DIR/todos"}"
    export TODOS_DIRECTORY

    echo "$*" >> "$TODOS_DIRECTORY/$(date +%Y-%m-%d).txt"
  '';
}

