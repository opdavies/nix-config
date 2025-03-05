{ config, lib, ... }:

with lib;

let
  cfg = config.homeManagerModules.syncthing;
in
{
  options.homeManagerModules.syncthing.enable = mkEnableOption "Enable syncthing";

  config = mkIf cfg.enable {
    services.syncthing.enable = true;
  };
}
