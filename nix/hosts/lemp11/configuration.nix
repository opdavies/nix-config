{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-intel
    inputs.nixos-hardware.nixosModules.common-pc-laptop
    inputs.nixos-hardware.nixosModules.common-pc-laptop-hdd
    inputs.nixos-hardware.nixosModules.system76

    ./hardware-configuration.nix

    ../common
    ../../users/opdavies
    ../../users/eric
    ../../users/luke
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

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

  services.thermald.enable = true;
  services.power-profiles-daemon.enable = false;

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';

  networking.networkmanager.enable = true;

  services.xserver.enable = true;

  services.xserver = {
    xkb = {
      layout = "gb";
      variant = "";
    };

    displayManager.lightdm.enable = true;
    desktopManager.cinnamon.enable = true;
  };

  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  services.avahi.openFirewall = true;

  services.printing.enable = true;

  services.pulseaudio.enable = false;

  hardware.bluetooth.enable = true;

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  services.pipewire = {
    enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    pulse.enable = true;
  };

  services.openssh.enable = true;

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

  services.gvfs.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-qt;
  };

  programs.firefox = {
    enable = true;
    languagePacks = [ "en-GB" ];
    preferences = {
      "intl.accept_languages" = "en-GB, en";
      "intl.regional_prefs.use_os_locales" = true;
    };
  };

  services.blueman.enable = true;

  services.auto-cpufreq.enable = true;

  services.udev = {
    enable = true;
    extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';
  };

  hardware.sane.enable = true;
}
