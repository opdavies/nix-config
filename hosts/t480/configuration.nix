{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./programs.nix
    ./secrets.nix
    ./services

    ../../modules/editor/nvim.nix
    ../../modules/mixins/bluetooth.nix
    ../../modules/mixins/common
    ../../modules/mixins/direnv.nix
    ../../modules/mixins/docker.nix
    ../../modules/mixins/flameshot.nix
    ../../modules/mixins/fonts.nix
    ../../modules/mixins/fzf.nix
    ../../modules/mixins/git.nix
    ../../modules/mixins/gtk.nix
    ../../modules/mixins/mpv.nix
    ../../modules/mixins/phpactor
    ../../modules/mixins/pipewire.nix
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
    backup-websites
    displayselect
    gtypist
    isync
    pam_gnupg
    peek
    slack
    sxiv
    ttyper
    upload-to-files
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
