{
  config,
  inputs,
  lib,
  self,
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

    xdg.configFile."ghostty/config".source = "${self}/ghostty/config";
  };
}
