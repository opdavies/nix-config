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

  core = {
    bluetooth.enable = true;
    zram.enable = true;
  };

  desktop.media.makemkv.enable = true;

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

  system.autoUpgrade.enable = true;

  environment.systemPackages = with pkgs; [
    fastfetch
    htop
    libreoffice
  ];
}
