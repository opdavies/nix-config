{
  imports = [ ../common ];

  homeManagerModules = {
    cli = {
      direnv.enable = true;
      fzf.enable = true;

      git = {
        enable = true;

        user.emailAddress = "oliver.davies@tfw.wales";
      };

      node.enable = true;
      ranger.enable = true;
      starship.enable = true;
      tmux.enable = true;
      tmux-sessionizer.enable = true;
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
