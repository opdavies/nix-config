{ config, lib, ... }:

{
  flake = {
    meta.owner.username = "opdavies";

    modules = {
      nixos.pc = {
        users.users.${config.flake.meta.owner.username} = {
          isNormalUser = true;
          initialPassword = lib.mkForce "";
          extraGroups = [ "input" "wheel" ];
        };

        nix.settings.trusted-users = [ config.flake.meta.owner.username ];
      };
    };
  };
}
