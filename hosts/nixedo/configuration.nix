# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports = [
    ../common
    ./hardware-configuration.nix
    ./homelab.nix
    ./modules
    ./secrets.nix
    ./services

    ../../users/opdavies.nix
  ];

  features = {
    core.openssh.enable = true;
    cli.podman.enable = true;
    desktop.dconf.enable = true;
  };

  services.logind.lidSwitchExternalPower = "ignore";

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
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
