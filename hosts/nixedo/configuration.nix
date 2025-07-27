# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, ... }:

{
  imports = [
    inputs.agenix.nixosModules.default

    ../common
    ./hardware-configuration.nix
    ./homelab.nix
    ./modules
    ./ports.nix
    ./secrets.nix
    ./services

    ../../users/opdavies.nix
  ];

  features = {
    cli.podman.enable = true;
  };

  # TODO: why didn't it work when adding this to jitsi.nix?
  nixpkgs.config.permittedInsecurePackages = [
    "jitsi-meet-1.0.8043"
  ];

  services.logind.lidSwitchExternalPower = "ignore";

  boot.loader = {
    efi.canTouchEfiVariables = true;
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
