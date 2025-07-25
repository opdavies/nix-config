{
  imports = [ ../common ];

  features = {
    cli.zsh.enable = true;

    desktop.media = {
      handbrake.enable = true;
      mpv.enable = true;
    };
  };
}
