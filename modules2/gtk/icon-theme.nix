{
  flake.modules.homeManager.gui =
    { pkgs, ... }:
    {
      gtk.iconTheme = {
        name = "Arc";
        package = pkgs.arc-icon-theme;
      };
    };
}
