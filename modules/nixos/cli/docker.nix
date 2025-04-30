{ config, lib, ... }:

with lib;

let
  cfg = config.features.cli.docker;
in
{
  options.features.cli.docker.enable = mkEnableOption "Enable docker";

  config = mkIf cfg.enable {
    virtualisation = {
      oci-containers.backend = "docker";

      docker = {
        enable = true;

        autoPrune = {
          enable = true;
          dates = "weekly";
        };
      };
    };
  };
}
