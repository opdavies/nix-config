{
  config,
  inputs,
  lib,
  system,
  ...
}:

with lib;

let
  cfg = config.features.desktop.ghostty;

  pkgs-master = inputs.nixpkgs-master.legacyPackages.${system};
in
{
  options.features.desktop.ghostty.enable = mkEnableOption "Enable ghostty";

  config = mkIf cfg.enable {
    home.packages = [ pkgs-master.ghostty ];

    xdg.configFile."ghostty/config".text = ''
      background = #000000

      # Disable ligatures.
      font-feature = -calt
      font-feature = -liga
      font-feature = -dlig

      window-decoration = false

      window-padding-x = 10
      window-padding-y = 10
    '';
  };
}
