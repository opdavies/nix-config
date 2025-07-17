{ config, lib, ... }:

with lib;

let
  cfg = config.features.core.bluetooth;
in
{
  options.features.core.bluetooth.enable = mkEnableOption "Enable bluetooth";

  config = mkIf cfg.enable {
    hardware.bluetooth.enable = true;

    services.blueman.enable = true;
  };
}
