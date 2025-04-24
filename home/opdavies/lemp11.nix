{
  imports = [ ../common ];

  homeManagerModules = {
    cli.zsh.enable = true;

    desktop.media = {
      makemkv.enable = true;
      mpv.enable = true;
    };
  };
}
