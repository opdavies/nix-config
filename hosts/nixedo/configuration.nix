# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, ... }:

{
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix
    ./secrets.nix

    mixins-common
    mixins-fzf
    mixins-openssh
    mixins-podman
    mixins-starship
    mixins-zsh

    users-opdavies

    ./modules/acme.nix
    ./modules/audiobookshelf.nix
    ./modules/cloudflared.nix
    ./modules/containers
    ./modules/forgejo.nix
    ./modules/immich.nix
    ./modules/jellyfin.nix
    ./modules/nginx
    ./modules/paperless.nix
  ];

  programs.dconf.enable = true;

  services.logind.lidSwitchExternalPower = "ignore";

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
