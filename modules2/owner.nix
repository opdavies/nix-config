{ config, lib, ... }:

{
  flake = {
    meta.owner = {
      email = "oliver@oliverdavies.uk";
      name = "Oliver Davies";
      username = "opdavies";
    };

    modules = {
      nixos.pc = {
        users.users.${config.flake.meta.owner.username} = {
          isNormalUser = true;
          initialPassword = lib.mkForce "";
          extraGroups = [
            "input"
            "wheel"
          ];
        };

        nix.settings.trusted-users = [ config.flake.meta.owner.username ];
      };
    };
  };
}
