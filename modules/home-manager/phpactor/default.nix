{ config, lib, ... }:

with lib;

let
  cfg = config.features.coding.phpactor;
in
{
  options.features.coding.phpactor.enable = mkEnableOption "Enable phpactor";

  config = mkIf cfg.enable {
    xdg.configFile.phpactor = {
      source = ./config;
      recursive = true;
    };
  };
}
