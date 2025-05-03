{ config, lib, ... }:

with lib;

let
  cfg = config.cli.docker;
in
{
  options.cli.docker.enable = mkEnableOption "Enable docker";

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
