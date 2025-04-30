{ config, lib, ... }:

with lib;

let
  cfg = config.features.cli.podman;
in
{
  options.features.cli.podman.enable = mkEnableOption "Enable podman";

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
