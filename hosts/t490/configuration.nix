{ pkgs, ... }:

{
  imports = [
    ../common

    ./hardware-configuration.nix
    ./hardware.nix
    ./secrets.nix
    ./services
    ./users.nix

    ../../users/opdavies.nix
  ];

  nixosModules = {
    core = {
      bluetooth.enable = true;
      zram.enable = true;
    };

    desktop.dconf.enable = true;
  };

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };

      efi = {
        canTouchEfiVariables = true;
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

  environment.systemPackages = with pkgs; [
    gtypist
    pam_gnupg
    sxiv
    ttyper
    yt-dlp
  ];

  networking.hosts = {
    "192.168.1.116" = [ "nixedo" ];
  };
}
