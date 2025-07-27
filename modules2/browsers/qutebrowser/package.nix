{
  flake.modules.homeManager.gui =
    { pkgs, ... }:
    {
      programs.qutebrowser.package = pkgs.stable.qutebrowser;
    };
}
