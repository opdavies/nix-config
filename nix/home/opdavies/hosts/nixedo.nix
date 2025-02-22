{ ... }:

{
  features = {
    cli = {
      direnv.enable = true;
      syncthing.enable = true;
    };

    desktop = {
      dwm.enable = true;
      # gtk.enable = true;
    };
  };
}
