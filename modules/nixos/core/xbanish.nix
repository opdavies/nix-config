{ config, lib, ... }:

with lib;

let
  cfg = config.nixosModules.core.xbanish;
in
{
  options.nixosModules.core.xbanish.enable = mkEnableOption "Enable xbanish";

  config = mkIf cfg.enable {
    services.xbanish.enable = true;
  };
}
