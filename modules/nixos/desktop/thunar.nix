{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.nixosModules.desktop.thunar;
in
{
  options.nixosModules.desktop.thunar.enable = mkEnableOption "Enable thunar";

  config = mkIf cfg.enable {
    programs.thunar = {
      enable = true;

      plugins = with pkgs.xfce; [
        thunar-archive-plugin
      ];
    };

    environment.systemPackages = with pkgs; [ xfce.tumbler ];
  };
}
