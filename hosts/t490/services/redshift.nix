{ config, lib, ... }:

with lib;

let
  cfg = config.redshift;
in
{
  options.redshift.enable = mkEnableOption "Enable redshift";

  config = mkIf cfg.enable {
    location = {
      latitude = 51.48;
      longitude = -3.17;
    };

    services.redshift = {
      enable = true;

      brightness = {
        day = "1";
        night = "1";
      };

      temperature = {
        day = 5500;
        night = 3700;
      };
    };
  };
}
