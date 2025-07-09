{ config, lib, ... }:

with lib;

let
  cfg = config.features.core.xbanish;
in
{
  options.features.core.xbanish.enable = mkEnableOption "Enable xbanish";

  config = mkIf cfg.enable {
    services.xbanish.enable = true;
  };
}
