{ config, lib, ... }:

with lib;

let
  cfg = config.nixosModules.core.pipewire;
in
{
  options.nixosModules.core.pipewire.enable = mkEnableOption "Enable pipewire";

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
