{ inputs, ... }:

{
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    mixins-avahi
    mixins-bluetooth
    mixins-common
    mixins-zram
    mixins-zsh

    users-opdavies
    users-eric
    users-luke
  ];

  services = {
    auto-cpufreq.enable = true;
    gvfs.enable = true;
    openssh.enable = true;
    power-profiles-daemon.enable = false;
    thermald.enable = true;

    pipewire = {
      enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };

      pulse.enable = true;
    };

    printing.enable = true;
    pulseaudio.enable = false;

    xserver = {
      enable = true;

      xkb = {
        layout = "gb";
        variant = "";
      };

      desktopManager.cinnamon.enable = true;
      displayManager.lightdm.enable = true;
    };
  };

  programs = {
    firefox = {
      enable = true;
      languagePacks = [ "en-GB" ];
      preferences = {
        "intl.accept_languages" = "en-GB, en";
        "intl.regional_prefs.use_os_locales" = true;
      };
    };
  };

  # Bootloader.
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 25;
      };

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
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
}
