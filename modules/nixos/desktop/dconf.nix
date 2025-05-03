{ config, lib, ... }:

with lib;

let
  cfg = config.desktop.dconf;
in
{
  options.desktop.dconf.enable = mkEnableOption "Enable dconf";

  config = mkIf cfg.enable {
    programs.dconf.enable = true;
  };
}
