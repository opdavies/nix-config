{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./programs.nix
    ./secrets.nix
    ./services

    ../../modules/profiles/dwm

    ../../modules/mixins/bluetooth.nix
    ../../modules/mixins/docker.nix
    ../../modules/mixins/phpactor
    ../../modules/mixins/thunar.nix

    ../common
    ../../users/opdavies
  ];

  nixosModules = {
    redshift.enable = true;
  };

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

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
    abook
    gtypist
    pam_gnupg
    peek
    sxiv
    ttyper
    yt-dlp
    zeroad
  ];

  zramSwap.enable = true;

  networking.hosts = {
    "192.168.1.116" = [ "nixedo" ];
  };
}
