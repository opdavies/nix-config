{
  services.xserver = {
    enable = true;

    displayManager.sessionCommands = ''
      setbg &
    '';

    displayManager.startx.enable = true;

    xkb = {
      layout = "gb";
      variant = "";
    };
  };

  services.displayManager.ly.enable = true;
}
