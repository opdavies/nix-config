{
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
}
