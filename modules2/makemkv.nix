{ config, ... }:

{
  flake.modules.nixos.pc =
    { pkgs, ... }:
    {
      boot.kernelModules = [ "sg" ];

      environment.systemPackages = with pkgs; [ makemkv ];

      users.users.${config.flake.meta.owner.username}.extraGroups = [ "cdrom" ];
    };
}
