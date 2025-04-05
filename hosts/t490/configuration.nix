{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
    ./programs.nix
    ./secrets.nix
    ./services
    ./users.nix

    ../common
    ../../users/opdavies
  ];

  nixosModules = {
    dwm.enable = true;
    redshift.enable = true;
    st.enable = true;
    thunar.enable = true;
    peek.enable = true;
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
    gtypist
    pam_gnupg
    rclone
    rclone-browser
    sxiv
    ttyper
    yt-dlp
  ];

  zramSwap.enable = true;

  networking.hosts = {
    "192.168.1.116" = [ "nixedo" ];
  };
}
