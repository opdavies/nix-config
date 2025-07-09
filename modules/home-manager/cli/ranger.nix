{ config, lib, ... }:

with lib;

let
  cfg = config.features.cli.ranger;
in
{
  options.features.cli.ranger.enable = mkEnableOption "Enable ranger";

  config = mkIf cfg.enable {
    programs.ranger.enable = true;
  };
}
