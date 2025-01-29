{
  features = {
    cli = {
      direnv.enable = true;

      notes = {
        enable = true;

        directory = "$HOME/Documents/wiki/tfw-notes";
      };

      syncthing.enable = true;
      tmux-sessionizer.enable = true;
    };

    desktop = {
      alacritty.enable = false;
    };
  };
}
