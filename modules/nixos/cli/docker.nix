{ config, lib, ... }:

with lib;

let
  cfg = config.nixosModules.cli.docker;
in
{
  options.nixosModules.cli.docker.enable = mkEnableOption "Enable docker";

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
