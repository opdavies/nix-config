{ config, ... }:

{
  flake.modules.nixos.pc = {
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

    users.users.${config.flake.meta.owner.username}.extraGroups = [ "docker" ];
  };
}
