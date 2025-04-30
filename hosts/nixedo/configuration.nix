# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

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

    homelab = {
      enable = true;

      baseDomain = "oliverdavies.uk";

      services = {
        audiobookshelf.enable = true;

        forgejo = {
          enable = true;

          cloudflared.tunnelId = "e1514105-327f-4984-974e-e2fbaca76466";
        };

        immich.enable = true;
        jellyfin.enable = true;
        paperless.enable = true;
        uptime-kuma.enable = true;
      };
    };
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

  powerManagement.powertop.enable = true;

  users.groups.media = { };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  environment.systemPackages = with pkgs; [
    tree
    vim
  ];
}
