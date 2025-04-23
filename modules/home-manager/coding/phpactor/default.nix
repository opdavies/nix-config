{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.homeManagerModules.coding.phpactor;
in
{
  options.homeManagerModules.coding.phpactor.enable = lib.mkEnableOption "Enable phpactor";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      phpactor
    ];

    xdg.configFile.phpactor = {
      source = ./config;
      recursive = true;
    };
  };
}
