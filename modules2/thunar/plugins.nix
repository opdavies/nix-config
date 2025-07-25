{
  flake.modules.pc.nixos =
    { pkgs, ... }:
    {
      programs.thunar.plugins = with pkgs.xfce; [
        thunar-archive-plugin
      ];
    };
}
