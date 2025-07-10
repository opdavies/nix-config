{ pkgs }:

pkgs.writeShellApplication {
  name = "move-firefox-screenshots";

  runtimeInputs = with pkgs; [ findutils ];

  text = ''
    original_directory="''${HOME}/Downloads"
    new_directory="''${HOME}/Pictures/Screenshots"

    find "''${original_directory}" -mindepth 1 -maxdepth 1 -type f -name "Screenshot *" \
      -exec mv {} "''${new_directory}" \;
  '';
}
