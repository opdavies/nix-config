{
  imports = [ ../common ];

  features = {
    cli.zsh.enable = true;

    desktop.media = {
      handbrake.enable = true;
      makemkv.enable = true;
      mpv.enable = true;
    };
  };
}
