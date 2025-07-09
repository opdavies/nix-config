{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.features.desktop.gtk;
in
{
  options.features.desktop.gtk.enable = mkEnableOption "Enable gtk";

  config = mkIf cfg.enable {
    gtk = with pkgs; {
      enable = true;

      theme = {
        name = "Arc-Dark";
        package = arc-theme;
      };

      iconTheme = {
        name = "Arc";
        package = arc-icon-theme;
      };

      gtk3.extraConfig.gtk-enable-animations = false;
      gtk4.extraConfig.gtk-enable-animations = false;
    };
  };
}
