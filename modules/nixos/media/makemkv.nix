{ config, lib, ... }:

with lib;

let
  cfg = config.features.desktop.media.makemkv;
in
{
  options.features.desktop.media.makemkv.enable = mkEnableOption "Enable makemkv";

  config = mkIf cfg.enable {
    boot.kernelModules = [ "sg" ];

    users.users.opdavies.extraGroups = [ "cdrom" ];
  };
}
