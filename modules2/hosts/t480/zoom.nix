{ config, ... }:

{
  nixpkgs.allowedUnfreePackages = [ "zoom" ];

  flake.modules.nixos."nixosConfigurations/t480" =
    { pkgs, ... }:
    {
      users.users."${config.flake.meta.owner.username}".packages = [ pkgs.zoom-us ];
    };
}
