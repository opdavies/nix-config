{ ... }:

{
  features = {
    cli = {
      direnv.enable = true;
      syncthing.enable = true;
    };

    desktop = {
      gtk.enable = true;
    };
  };
}
