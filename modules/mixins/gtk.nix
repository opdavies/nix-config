{
  home-manager.users.opdavies =
    { pkgs, ... }:
    {
      gtk = {
        enable = true;

        theme = {
          name = "Arc-Dark";
          package = pkgs.arc-theme;
        };

        iconTheme = {
          name = "Arc";
          package = pkgs.arc-icon-theme;
        };

        gtk3.extraConfig.gtk-enable-animations = false;
        gtk4.extraConfig.gtk-enable-animations = false;
      };
    };
}
