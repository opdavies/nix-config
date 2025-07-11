{ pkgs }:

pkgs.writeShellApplication {
  name = "todos-edit";

  text = ''
    exec "$EDITOR" "$HOME/Documents/wiki/todo.txt"
  '';
}
