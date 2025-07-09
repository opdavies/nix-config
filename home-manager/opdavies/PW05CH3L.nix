{ config, ... }:

{
  imports = [ ../common ];

  features = {
    cli = {
      bookmarkthis.enable = true;
      direnv.enable = true;
      fzf.enable = true;

      git = {
        enable = true;

        user.emailAddress = "oliver.davies@tfw.wales";
      };

      node.enable = true;
      notes.enable = true;
      ranger.enable = true;
      starship.enable = true;
      tmux.enable = true;

      tmux-sessionizer = {
        enable = true;

        searchPaths = [
          "${config.xdg.userDirs.extraConfig.XDG_REPOS_DIR}:2"
          "${config.xdg.userDirs.documents}:1"
        ];
      };

      todos.enable = true;
      zsh.enable = true;
    };

    coding = {
      neovim.enable = true;
      phpactor.enable = true;
    };
  };

  xdg.configFile."pam-gnupg".text = ''
    C0D940F9A390F286FCAAE8439D501171E39D0A47
  '';
}
