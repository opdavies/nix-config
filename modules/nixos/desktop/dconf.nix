{ config, lib, ... }:

with lib;

let
  cfg = config.nixosModules.desktop.dconf;
in
{
  options.nixosModules.desktop.dconf.enable = mkEnableOption "Enable dconf";

  config = mkIf cfg.enable {
    programs.dconf.enable = true;
  };
}
