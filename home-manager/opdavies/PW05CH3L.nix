{ config, pkgs, ... }:

{
  imports = [ ../common ];

  features = {
    cli = {
      bookmarkthis.enable = true;
      direnv.enable = true;
      fzf.enable = true;

      git.enable = true;
      git.user.emailAddress = "oliver.davies@tfw.wales";

      node.enable = true;
      notes.enable = true;
      ranger.enable = true;
      starship.enable = true;
      tmux.enable = true;

      tmux-sessionizer.enable = true;
      tmux-sessionizer.searchPaths =
        let
          inherit (config.xdg) userDirs;
        in
        [
          "${userDirs.extraConfig.XDG_REPOS_DIR}:2"
          "${userDirs.documents}:1"
        ];

      zsh.enable = true;
    };

    coding = {
      neovim.enable = true;
      phpactor.enable = true;
    };
  };

  home.packages = with pkgs; [
    tag-release
    todos-add
    update-all-git-repos
  ];

  xdg.configFile."pam-gnupg".text = ''
    C0D940F9A390F286FCAAE8439D501171E39D0A47
  '';
}
