{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./programs.nix
    ./secrets.nix
    ./services

    ../../modules/editor/nvim.nix

    ../../modules/profiles/dwm

    ../../modules/mixins/bluetooth.nix
    ../../modules/mixins/direnv.nix
    ../../modules/mixins/docker.nix
    ../../modules/mixins/fzf.nix
    ../../modules/mixins/phpactor
    ../../modules/mixins/pipewire.nix
    ../../modules/mixins/thunar.nix

    ../common
    ../../users/opdavies
  ];

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
    slack
    sxiv
    ttyper
    yt-dlp
    zeroad
    zoom-us
  ];

  zramSwap.enable = true;

  networking.hosts = {
    "192.168.1.116" = [ "nixedo" ];
  };
}
