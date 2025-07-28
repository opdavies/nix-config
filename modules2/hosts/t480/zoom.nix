{
  flake.modules.nixos."nixosConfigurations/t480" =
    { config, pkgs, ... }:
    {
      nixpkgs.allowedUnfreePackages = [ "zoom-us" ];

      users.users."${config.flake.meta.owner.username}".packages = [ pkgs.zoom-us ];
    };
}
