{ pkgs, ... }:

{
  home.packages = with pkgs; [
    count-tags
    create-script
    get-tags
    tag-release
    time-until
    update-all-git-repos
    vic
    zet-new
  ];

  xdg.configFile."pam-gnupg".text = ''
    C0D940F9A390F286FCAAE8439D501171E39D0A47
  '';
}
