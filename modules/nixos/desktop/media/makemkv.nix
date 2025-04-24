{ config, lib, ... }:

with lib;

let
  cfg = config.nixosModules.desktop.media.makemkv;
in
{
  options.nixosModules.desktop.media.makemkv.enable = mkEnableOption "Enable makemkv";

  config = mkIf cfg.enable {
    boot.kernelModules = [ "sg" ];

    # TODO: is this needed?
    # users.users.opdavies.extraGroups = [ "cdrom" ];
  };
}
