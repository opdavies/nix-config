{
  features = {
    cli = {
      direnv.enable = true;
      neovim.enable = true;
      tmux.enable = true;

      notes = {
        enable = true;

        directory = "$HOME/Documents/wiki/tfw-notes";
      };

      syncthing.enable = true;
      tmux-sessionizer.enable = true;
    };
  };
}
