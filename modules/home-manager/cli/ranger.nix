{ config, lib, ... }:

with lib;

let
  cfg = config.cli.ranger;
in
{
  options.cli.ranger.enable = mkEnableOption "Enable ranger";

  config = mkIf cfg.enable {
    programs.ranger.enable = true;
  };
}
