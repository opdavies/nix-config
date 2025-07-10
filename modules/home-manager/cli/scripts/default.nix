{ pkgs, ... }:

{
  # TODO: separate desktop-only scripts?
  home.packages =
    let
      scriptNames = [
        "create-script"
        "mounter"
        "move-firefox-screenshots"
        "setbg"
        "tag-release"
        "unmounter"
        "update-all-git-repos"
      ];
    in
    map (name: pkgs.callPackage ./${name}.nix { }) scriptNames;
}
