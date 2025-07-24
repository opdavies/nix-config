{ config, inputs, lib, ... }:

{
  flake.modules.nixos.pc = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
      extraSpecialArgs.hasGlobalPkgs = true;
      useGlobalPkgs = true;

      # https://github.com/nix-community/home-manager/issues/6770
      # useUserPackages = true;

      users.${config.flake.meta.owner.username}.imports = [
        (
          { osConfig, ... }:

          {
            home.stateVersion = lib.mkForce osConfig.system.stateVersion;
          }
        )

        config.flake.modules.homeManager.base
      ];
    };
  };
}
