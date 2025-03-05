{
  homeManagerModules = {
    direnv.enable = true;
    neovim.enable = true;

    notes = {
      enable = true;
      directory = "$HOME/Documents/wiki/tfw-notes";
    };

    syncthing.enable = true;
    tmux.enable = true;
    tmux-sessionizer.enable = true;
  };
}
