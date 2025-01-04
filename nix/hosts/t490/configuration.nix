{
  inputs,
  pkgs,
  username,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix

    ../common
    ../../users/opdavies

  ];

  features = {
    desktop = {
      autorandr.enable = true;
      gaming.enable = true;
      i3.enable = true;
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

  services.throttled.enable = true;
  services.thermald.enable = true;
  services.power-profiles-daemon.enable = false;

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';

  networking.networkmanager.enable = true;

  services.xserver = {
    enable = true;

    xkb = {
      layout = "gb";
      variant = "";
    };
  };

  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  services.avahi.openFirewall = true;

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;

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

  users.users.${username} = {
    extraGroups = [ "media" ];

    packages = with pkgs; [
      android-tools
      via
    ];
  };

  users.groups.media = { };

  environment.systemPackages = with pkgs; [
    gtypist
    rclone
    rclone-browser
    ttyper
    yt-dlp
    ytfzf
  ];

  services.openssh.enable = true;

  programs.dconf.enable = true;

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

  # Make Caps lock work as an Escape key on press and Ctrl on hold.
  services.interception-tools =
    let
      dfkConfig = pkgs.writeText "dual-function-keys.yaml" ''
        MAPPINGS:
          - KEY: KEY_CAPSLOCK
            TAP: KEY_ESC
            HOLD: KEY_LEFTCTRL
      '';
    in
    {
      enable = true;
      plugins = pkgs.lib.mkForce [ pkgs.interception-tools-plugins.dual-function-keys ];
      udevmonConfig = ''
        - JOB: "${pkgs.interception-tools}/bin/intercept -g $DEVNODE | ${pkgs.interception-tools-plugins.dual-function-keys}/bin/dual-function-keys -c ${dfkConfig} | ${pkgs.interception-tools}/bin/uinput -d $DEVNODE"
          DEVICE:
            NAME: "AT Translated Set 2 keyboard"
            EVENTS:
              EV_KEY: [[KEY_CAPSLOCK, KEY_ESC, KEY_LEFTCTRL]]
      '';
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

  services.cron = {
    enable = true;

    systemCronJobs = [ "* * * * * opdavies /home/${username}/.local/bin/notify-battery" ];
  };

  services.auto-cpufreq.enable = true;

  services.udev = {
    enable = true;
    extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';
  };
}
