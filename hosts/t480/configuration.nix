{ pkgs, ... }:

{
  imports = [
    ../common

    ./hardware-configuration.nix
    ./modules
    ./secrets.nix
    ./services.nix

    ../../users/opdavies.nix
  ];

  features = {
    cli.password-store = {
      enable = true;

      extensions = with pkgs.passExtensions; [
        pass-audit
        pass-otp
        pass-update
      ];
    };

    core = {
      bluetooth.enable = true;
      openssh.enable = true;
      pipewire.enable = true;
      xbanish.enable = true;
      zram.enable = true;
    };

    desktop = {
      dconf.enable = true;
      dwm.enable = true;
      fonts.enable = true;
      media.makemkv.enable = true;
      st.enable = true;
      thunar.enable = true;
    };
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
    tailscale
    abook
    acpi
    arandr
    backup-websites
    brightnessctl
    build-glove80
    cdrkit
    cpufrequtils
    displayselect
    dvdbackup
    dvdplusrwtools
    ffmpegthumbnailer
    gimp
    gscan2pdf
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
    sxiv
    ttyper
    upload-to-files
    xcape
    xsel
    yt-dlp
    zeroad
    zoom-us
  ];
}
