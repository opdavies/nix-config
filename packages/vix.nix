{ pkgs }:

pkgs.writeShellApplication {
  name = "vix";

  runtimeInputs = with pkgs; [ neovim ];

  text = ''
    cmd=$(command -v "$1")
    test -n "$cmd" && exec "$EDITOR" "$cmd"
  '';
}
