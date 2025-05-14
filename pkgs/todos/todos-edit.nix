{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "todos-edit";

  text = ''
    TODOS_DIRECTORY="''${TODOS_DIRECTORY:-"$XDG_DOCUMENTS_DIR/todos"}"
    export TODOS_DIRECTORY

    "$EDITOR" "$TODOS_DIRECTORY/$(date +%Y-%m-%d).txt";
  '';
}
