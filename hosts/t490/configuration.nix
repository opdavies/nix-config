{ inputs, ... }:

{
  imports = [
    inputs.agenix.nixosModules.default
    inputs.nixos-hardware.nixosModules.common-gpu-intel
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t490

    ../common

    ./hardware-configuration.nix
    ./hardware.nix
    ./services

    ../../users/luke.nix
    ../../users/opdavies.nix
  ];

  features = {
    core.zram.enable = true;
    desktop.dconf.enable = true;
  };

  nixpad.enable = true;

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;

      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 10;
    };
  };

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';

  networking.networkmanager.enable = true;
}
