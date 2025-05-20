{ config, lib, ... }:

with lib;

let
  cfg = config.coding.phpactor;
in
{
  options.coding.phpactor.enable = mkEnableOption "Enable phpactor";

  config = mkIf cfg.enable {
    xdg.configFile.phpactor = {
      source = ./config;
      recursive = true;
    };
  };
}
