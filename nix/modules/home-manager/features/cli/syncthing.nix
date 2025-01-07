{ config, lib, ... }:

with lib;

let
  cfg = config.features.cli.syncthing;
in
{
  options.features.cli.syncthing.enable = mkEnableOption "Enable syncthing";

  config = mkIf cfg.enable {
    services.syncthing.enable = true;
  };
}
