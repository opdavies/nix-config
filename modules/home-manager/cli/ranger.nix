{ config, lib, ... }:

with lib;

let
  cfg = config.homeManagerModules.cli.ranger;
in
{
  options.homeManagerModules.cli.ranger.enable = mkEnableOption "Enable ranger";

  config = mkIf cfg.enable {
    programs.ranger.enable = true;
  };
}
