{ pkgs }:

pkgs.writeShellApplication {
  name = "count-tags";

  runtimeInputs = with pkgs; [
    coreutils
    get-tags
  ];

  text = ''
    get-tags "''${1:-}" | wc -l
  '';
}
