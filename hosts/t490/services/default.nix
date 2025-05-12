{
  imports = [
    ./cron.nix
    ./interception-tools.nix
    ./sound.nix
    ./udev.nix
    ./xserver.nix
  ];

  services = {
    auto-cpufreq.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    blueman.enable = true;

    gvfs.enable = true;
    openssh.enable = true;
    power-profiles-daemon.enable = false;
    printing.enable = true;
    pulseaudio.enable = false;
    throttled.enable = true;
    thermald.enable = true;
    upower.enable = true;

    xserver = {
      desktopManager.cinnamon.enable = true;
      displayManager.lightdm.enable = true;
    };
  };
}
