# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/acme.nix
  ];

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
}
