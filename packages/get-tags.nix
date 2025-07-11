{ pkgs }:

pkgs.writeShellApplication {
  name = "get-tags";

  runtimeInputs = with pkgs; [ git ];

  text = ''
    if [[ "$#" -gt 0 ]]; then
      git tag | grep "$*"
      exit 0
    fi

    git tag
  '';
}
