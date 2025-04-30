{ config, lib, ... }:

with lib;

let
  cfg = config.features.desktop.dconf;
in
{
  options.features.desktop.dconf.enable = mkEnableOption "Enable dconf";

  config = mkIf cfg.enable {
    programs.dconf.enable = true;
  };
}
