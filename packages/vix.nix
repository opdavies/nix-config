{ pkgs }:

pkgs.writeShellApplication {
  name = "vix";

  text = ''
    cmd=$(command -v "$1")
    test -n "$cmd" && exec "$EDITOR" "$cmd"
  '';
}
