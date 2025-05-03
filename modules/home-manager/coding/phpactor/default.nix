{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.coding.phpactor;
in
{
  options.coding.phpactor.enable = lib.mkEnableOption "Enable phpactor";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      phpactor
    ];

    xdg.configFile.phpactor = {
      source = ./config;
      recursive = true;
    };
  };
}
