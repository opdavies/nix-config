{
  flake.modules.homeManager.gui.gtk = {
    gtk3.extraConfig.gtk-enable-animations = false;
    gtk4.extraConfig.gtk-enable-animations = false;
  };
}
