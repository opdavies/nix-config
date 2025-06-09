{ config, lib, ... }:

let
  cfg = config.desktop.redshift;

  inherit (lib) mkEnableOption mkIf;
in
{
  options.desktop.redshift = {
    enable = mkEnableOption "Enable redshift";
  };

  config = mkIf cfg.enable {
    services.redshift.enable = true;

    services.redshift.latitude = "51.58";
    services.redshift.longitude = "-2.99";
  };
}
