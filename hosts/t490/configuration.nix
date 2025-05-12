{
  imports = [
    ../common

    ./hardware-configuration.nix
    ./hardware.nix
    ./services

    ../../users/luke.nix
    ../../users/opdavies.nix
  ];

  core = {
    bluetooth.enable = true;
    zram.enable = true;
  };

  desktop.dconf.enable = true;

  nixpad.enable = true;

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
}
