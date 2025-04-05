# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./secrets.nix
    ./services.nix

    ../../modules/mixins/docker.nix
    ../../modules/mixins/zsh

    ./modules/acme.nix
    ./modules/audiobookshelf.nix
    ./modules/containers/pi-hole.nix
    ./modules/forgejo.nix
    ./modules/immich.nix
    ./modules/jellyfin.nix
    ./modules/paperless.nix

    ../common
    ../../users/opdavies
  ];

  nixosModules = {
    audiobookshelf.enable = true;
    immich.enable = true;
    jellyfin.enable = true;
    paperless.enable = true;
    pihole.enable = true;
  };

  programs.dconf.enable = true;

  services.logind.lidSwitchExternalPower = "ignore";

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };

    systemd-boot.enable = true;
  };

  networking.networkmanager.enable = true;

  users.groups.media = { };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
}
