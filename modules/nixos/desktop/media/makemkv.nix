{ config, lib, ... }:

with lib;

let
  cfg = config.desktop.media.makemkv;
in
{
  options.desktop.media.makemkv.enable = mkEnableOption "Enable makemkv";

  config = mkIf cfg.enable {
    boot.kernelModules = [ "sg" ];

    users.users.opdavies.extraGroups = [ "cdrom" ];
  };
}
