{ config, lib, ... }:

with lib;

let
  cfg = config.core.xbanish;
in
{
  options.core.xbanish.enable = mkEnableOption "Enable xbanish";

  config = mkIf cfg.enable {
    services.xbanish.enable = true;
  };
}
