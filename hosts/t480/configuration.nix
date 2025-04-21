{ inputs, pkgs, ... }:

let
  git = {
    name = "Oliver Davies";
    emailAddress = "oliver@oliverdavies.uk";
  };
in
{
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix
    ./secrets.nix

    editor-nvim
    mixins-avahi
    mixins-bluetooth
    mixins-common
    mixins-direnv
    mixins-firefox
    mixins-flameshot
    mixins-fonts
    mixins-fzf
    mixins-gnupg
    mixins-gtk
    mixins-qutebrowser
    mixins-mpv
    mixins-node
    mixins-notes
    mixins-phpactor
    mixins-pipewire
    mixins-ranger
    mixins-screenkey
    mixins-scripts
    mixins-starship
    mixins-thunar
    mixins-tmux
    mixins-zram
    mixins-zsh
    profiles-dwm
    profiles-xbanish

    (import ../../modules/mixins/git.nix { inherit git; })

    (import ../../modules/mixins/kanata.nix {
      devices = [
        "/dev/input/event1"
      ];
    })

    users-opdavies

    ./modules/cron.nix
    ./modules/neomutt.nix
    ./modules/newsboat
    ./modules/ollama.nix
    ./modules/wiki.nix
  ];

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
    acpi
    arandr
    backup-websites
    brightnessctl
    build-glove80
    cpufrequtils
    displayselect
    ffmpegthumbnailer
    gimp
    gscan2pdf
    gtypist
    handbrake
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

  services = {
    auto-cpufreq.enable = true;
    gvfs.enable = true;
    power-profiles-daemon.enable = false;
    printing.enable = true;
    pulseaudio.enable = false;
    throttled.enable = true;
    thermald.enable = true;
    upower.enable = true;

    xserver = {
      enable = true;

      xkb = {
        layout = "gb";
        variant = "";
      };
    };
  };

  programs.dconf.enable = true;
}
