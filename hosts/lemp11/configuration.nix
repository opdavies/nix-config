{ pkgs, ... }:

{
  imports = [
    ../common
    ./hardware-configuration.nix
    ./programs.nix
    ./services.nix

    ../../users/opdavies.nix
    ../../users/eric.nix
  ];

  nixosModules = {
    core = {
      bluetooth.enable = true;
      zram.enable = true;
    };
  };

  # Bootloader.
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 25;
      };

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
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
}
