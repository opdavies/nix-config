{
  services = {
    auto-cpufreq.enable = true;
    gvfs.enable = true;
    power-profiles-daemon.enable = false;
    printing.enable = true;
    pulseaudio.enable = false;
    tailscale.enable = true;
    throttled.enable = true;
    thermald.enable = true;
    upower.enable = true;

    xserver = {
      enable = true;

      displayManager.startx.enable = true;

      xkb = {
        layout = "gb";
        variant = "";
      };
    };
  };
}
