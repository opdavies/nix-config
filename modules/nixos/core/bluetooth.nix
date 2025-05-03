{ config, lib, ... }:

with lib;

let
  cfg = config.core.bluetooth;
in
{
  options.core.bluetooth.enable = mkEnableOption "Enable bluetooth";

  config = mkIf cfg.enable {
    hardware.bluetooth.enable = true;

    services.blueman.enable = true;
  };
}
