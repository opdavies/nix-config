{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    makemkv
  ];

  boot.kernelModules = [ "sg" ];

  # TODO: is this needed?
  users.users.opdavies.extraGroups = [ "cdrom" ];
}
