{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
    ./programs.nix
    ./secrets.nix
    ./services
    ./users.nix

    ./modules/docker.nix

    ../common
    ../../users/opdavies
  ];

  features = {
    desktop = {
      autorandr.enable = true;
      dwm.enable = true;
      gaming.enable = true;
      thunar.enable = true;
      peek.enable = true;
    };
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
    newsboat
    pass
    rclone
    rclone-browser
    sxiv
    ttyper
    yt-dlp
  ];

  zramSwap.enable = true;

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };

    optimise.automatic = true;

    settings = {
      auto-optimise-store = true;

      experimental-features = [
        "nix-command"
        "flakes"
      ];

      warn-dirty = false;
    };
  };

  networking.hosts = {
    "192.168.1.116" = [ "nixedo" ];
  };
}
