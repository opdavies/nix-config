{
  services.xserver = {
    enable = true;

    displayManager.startx.enable = true;

    xkb = {
      layout = "gb";
      variant = "";
    };
  };

  services.displayManager.ly.enable = true;
}
