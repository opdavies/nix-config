{
  flake.modules.nixos."nixosConfigurations/t480" =
    { config, pkgs, ... }:
    {
      nixpkgs.allowedUnfreePackages = [ "slack" ];

      users.users."${config.flake.meta.owner.username}".packages = [ pkgs.slack ];
    };
}
