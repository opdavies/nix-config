{ config, lib, ... }:

with lib;

let
  cfg = config.nixosModules.cli.podman;
in
{
  options.nixosModules.cli.podman.enable = mkEnableOption "Enable podman";

  config = mkIf cfg.enable {
    virtualisation = {
      oci-containers.backend = "podman";

      podman = {
        enable = true;

        autoPrune = {
          enable = true;
          dates = "weekly";
        };
      };
    };
  };
}
