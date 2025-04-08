{ inputs, pkgs, ... }:

let
  git = {
    name = "Oliver Davies";
    emailAddress = "oliver@oliverdavies.uk";
  };
in
{
  imports = [
    ./hardware-configuration.nix
    ./secrets.nix

    ../../modules/editor/nvim.nix
    ../../modules/mixins/bluetooth.nix
    ../../modules/mixins/common
    ../../modules/mixins/direnv.nix
    ../../modules/mixins/docker.nix
    ../../modules/mixins/firefox.nix
    ../../modules/mixins/flameshot.nix
    ../../modules/mixins/fonts.nix
    ../../modules/mixins/fzf.nix
    ../../modules/mixins/gnupg.nix
    ../../modules/mixins/gtk.nix
    ../../modules/mixins/qutebrowser.nix
    ../../modules/mixins/mpv.nix
    ../../modules/mixins/node.nix
    ../../modules/mixins/phpactor
    ../../modules/mixins/pipewire.nix
    ../../modules/mixins/ranger.nix
    ../../modules/mixins/screenkey.nix
    ../../modules/mixins/scripts
    ../../modules/mixins/starship.nix
    ../../modules/mixins/thunar.nix
    ../../modules/mixins/tmux.nix
    ../../modules/mixins/zsh
    ../../modules/profiles/dwm
    ../../modules/profiles/xbanish.nix

    (import ../../modules/mixins/git.nix { inherit git; })

    ../../users/opdavies

    ./modules/cron.nix
    ./modules/neomutt.nix
    ./modules/newsboat
    ./modules/notes.nix
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

  zramSwap.enable = true;

  networking.hosts = {
    "192.168.1.116" = [ "nixedo" ];
  };

  services = {
    auto-cpufreq.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    gvfs.enable = true;
    openssh.enable = true;
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
}
