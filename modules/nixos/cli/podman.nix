{ config, lib, ... }:

with lib;

let
  cfg = config.cli.podman;
in
{
  options.cli.podman.enable = mkEnableOption "Enable podman";

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
