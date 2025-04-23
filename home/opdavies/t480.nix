{
  imports = [ ../common ];

  homeManagerModules = {
    cli = {
      bluetuith.enable = true;
      direnv.enable = true;
      fzf.enable = true;

      git = {
        enable = true;

        user.emailAddress = "oliver@oliverdavies.uk";
      };

      node.enable = true;
      notes.enable = true;
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

    desktop = {
      firefox.enable = true;
      flameshot.enable = true;
      gtk.enable = true;
      mpv.enable = true;
      qutebrowser.enable = true;
    };
  };

  xdg.configFile."pam-gnupg".text = ''
    098EE055DAD2B9CB68154C6759DD38292D2273B6
    1E21B58D69FFEFAD077F152A50FEA938A3413F50
  '';
}
