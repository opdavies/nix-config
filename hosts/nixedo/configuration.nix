# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  imports = [
    ../common
    ./hardware-configuration.nix
    ./modules
    ./secrets.nix
    ./services

    ../../users/opdavies.nix
  ];

  nixosModules = {
    core.openssh.enable = true;
    cli.podman.enable = true;
    desktop.dconf.enable = true;
  };

  services.logind.lidSwitchExternalPower = "ignore";

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };

    systemd-boot.enable = true;
  };

  networking.networkmanager.enable = true;

  users.users.opdavies.extraGroups = [ "media" ];
  users.groups.media = { };
}
