{ inputs, pkgs, ... }:

{
  imports = [
    inputs.agenix.nixosModules.default
    inputs.nixos-hardware.nixosModules.common-gpu-intel
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480

    ../common

    ./hardware-configuration.nix
    ./cron.nix
    ./neomutt.nix
    ./newsboat
    ./secrets.nix
    ./xserver.nix

    ../../users/opdavies.nix
  ];

  features = {
    cli = {
      kanata.enable = true;
      kanata.devices = [
        "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
      ];
    };

    desktop = {
      dwm.enable = true;
    };
  };

  services = {
    auto-cpufreq.enable = true;
    geoclue2.enable = true;
    gvfs.enable = true;
    power-profiles-daemon.enable = false;
    printing.enable = true;
    pulseaudio.enable = false;
    tailscale.enable = true;
    thermald.enable = true;
    throttled.enable = true;
    upower.enable = true;
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 10;

      efi.canTouchEfiVariables = true;
    };
  };

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';

  networking.networkmanager.enable = true;

  networking.hosts = {
    "192.168.1.116" = [
      "home.oliverdavies.uk"
      "jellyfin.oliverdavies.uk"
      "nixedo.oliverdavies.uk"
      "paperless.oliverdavies.uk"
      "photos.oliverdavies.uk"
      "ssh.oliverdavies.uk"
      "tubearchivist.oliverdavies.uk"
    ];
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  environment.systemPackages = with pkgs; [
    abook
    acpi
    arandr
    brightnessctl
    cdrkit
    cpufrequtils
    dvdbackup
    dvdplusrwtools
    ffmpegthumbnailer
    gimp3
    gtypist
    hunspellDicts.en-gb-large
    isync
    kdePackages.kdenlive
    kdePackages.okular
    libnotify
    libreoffice
    meslo-lg
    obs-studio
    pam_gnupg
    pamixer
    pavucontrol
    peek
    pmutils
    shotwell
    slack
    stable.gscan2pdf
    sxiv
    tailscale
    ttyper
    xcape
    xsel
    yt-dlp
    zoom-us
  ];
}
