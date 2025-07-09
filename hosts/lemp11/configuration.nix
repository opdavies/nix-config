{ inputs, pkgs, ... }:

{
  imports = [
    inputs.agenix.nixosModules.default
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-intel
    inputs.nixos-hardware.nixosModules.common-pc-laptop
    inputs.nixos-hardware.nixosModules.common-pc-laptop-hdd
    inputs.nixos-hardware.nixosModules.system76

    ../common
    ./hardware-configuration.nix
    ./programs.nix
    ./services.nix

    ../../users/opdavies.nix
    ../../users/eric.nix
  ];

  features = {
    core = {
      bluetooth.enable = true;
      zram.enable = true;
    };

    desktop.media.makemkv.enable = true;
  };

  nixpad.enable = true;

  # Bootloader.
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";

      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 25;
    };
  };

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';

  networking.networkmanager.enable = true;

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  users.users.eric.packages = with pkgs; [
    git
    vscodium
  ];

  environment.systemPackages = with pkgs; [
    fastfetch
    htop
  ];
}
