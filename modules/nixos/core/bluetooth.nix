{ config, lib, ... }:

with lib;

let
  cfg = config.nixosModules.core.bluetooth;
in
{
  options.nixosModules.core.bluetooth.enable = mkEnableOption "Enable bluetooth";

  config = mkIf cfg.enable {
    hardware.bluetooth.enable = true;

    services.blueman.enable = true;
  };
}
