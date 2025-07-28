{
  flake.modules.homeManager.gui =
    { pkgs, ... }:
    {
      gtk.theme = {
        name = "Arc-Dark";
        package = pkgs.arc-theme;
      };
    };
}
