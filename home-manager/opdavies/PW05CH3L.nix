{ pkgs, ... }:

{
  imports = [ ../common ];

  features = {
    cli = {
      bookmarkthis.enable = true;
      node.enable = true;
      starship.enable = true;
      zsh.enable = true;
    };
  };

  home.packages = with pkgs; [
    count-tags
    create-script
    get-tags
    tag-release
    time-until
    update-all-git-repos
    vix
    zet-new
  ];

  xdg.configFile."pam-gnupg".text = ''
    C0D940F9A390F286FCAAE8439D501171E39D0A47
  '';
}
