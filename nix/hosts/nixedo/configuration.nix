# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, ... }:

{
  imports = [
    ../common
    ../../users/opdavies

    ./hardware-configuration.nix
    ./secrets.nix

    ./modules/acme.nix
  ];

  features = {
    cli = {
      docker.enable = true;
    };

    homelab = {
      audiobookshelf.enable = true;
      beaverhabits.enable = true;
      forgejo.enable = true;
      freshrss.enable = true;
      gitea.enable = true;
      immich.enable = true;
      jellyfin.enable = true;
      paperless.enable = true;
      pihole.enable = true;
      tubearchivist-container.enable = true;
      vaultwarden.enable = true;
    };
  };

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

  services.openssh.enable = true;

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  services.caddy.enable = true;

  programs.dconf.enable = true;

  services.logind.lidSwitchExternalPower = "ignore";

  age.identityPaths = [
    "/home/opdavies/.ssh/id_rsa"
  ];
}
