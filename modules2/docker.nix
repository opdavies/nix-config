{ config, lib, ... }:

{
  flake.modules.nixos.pc = args: {
    options.docker.enable = lib.mkEnableOption "Enable Docker";

    config = lib.mkIf args.config.docker.enable {
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
  };
}
