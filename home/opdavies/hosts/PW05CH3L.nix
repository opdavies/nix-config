{
  homeManagerModules = {
    direnv.enable = true;
    neovim.enable = true;

    notes = {
      enable = true;
      directory = "$HOME/Documents/wiki/tfw-notes";
    };

    tmux.enable = true;
    tmux-sessionizer.enable = true;
  };

  home.sessionVariables = {
    WAYLAND_DISPLAY = "";
  };
}
