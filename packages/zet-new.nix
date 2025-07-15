{ pkgs }:

pkgs.writeShellApplication {
  name = "zet-new";

  runtimeInputs = with pkgs; [
    coreutils
  ];

  text = ''
    folder="''${ZET_DIR:-"$XDG_DOCUMENTS_DIR/wiki/zet"}"

    mkdir -p "$folder"

    note="$folder/$(date +%Y-%m-%d-%T | sed 's/[-:]//g').md"

    printf "# %s\n\n\n" "$1" > "$note"

    "$EDITOR" "+normal G" "$note"
  '';
}
