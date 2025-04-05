{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./programs.nix
    ./secrets.nix
    ./services

    ../../modules/editor/nvim.nix
    ../../modules/mixins/bluetooth.nix
    ../../modules/mixins/common.nix
    ../../modules/mixins/direnv.nix
    ../../modules/mixins/docker.nix
    ../../modules/mixins/firefox.nix
    ../../modules/mixins/flameshot.nix
    ../../modules/mixins/fonts.nix
    ../../modules/mixins/fzf.nix
    ../../modules/mixins/git.nix
    ../../modules/mixins/gnupg.nix
    ../../modules/mixins/gtk.nix
    ../../modules/mixins/qutebrowser.nix
    ../../modules/mixins/mpv.nix
    ../../modules/mixins/node.nix
    ../../modules/mixins/phpactor
    ../../modules/mixins/pipewire.nix
    ../../modules/mixins/ranger.nix
    ../../modules/mixins/screenkey.nix
    ../../modules/mixins/starship.nix
    ../../modules/mixins/thunar.nix
    ../../modules/mixins/tmux.nix
    ../../modules/mixins/zsh
    ../../modules/profiles/dwm
    ../../modules/profiles/xbanish.nix

    ../../users/opdavies

    ./modules/neomutt.nix
    ./modules/newsboat
    ./modules/notes.nix
    ./modules/wiki.nix
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
    acpi
    arandr
    backup-websites
    brightnessctl
    build-glove80
    cpufrequtils
    displayselect
    ffmpegthumbnailer
    gscan2pdf
    gtypist
    hunspellDicts.en-gb-large
    isync
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

  users.users.opdavies.packages = with pkgs; [
    gimp
    handbrake
    kdePackages.kdenlive
  ];
}
