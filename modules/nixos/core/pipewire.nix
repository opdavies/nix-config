{ config, lib, ... }:

with lib;

let
  cfg = config.features.core.pipewire;
in
{
  options.features.core.pipewire.enable = mkEnableOption "Enable pipewire";

  config = mkIf cfg.enable {
    services.pipewire = {
      enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };

      pulse.enable = true;
    };
  };
}
