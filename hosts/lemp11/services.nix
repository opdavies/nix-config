{
  services = {
    auto-cpufreq.enable = true;
    gvfs.enable = true;
    power-profiles-daemon.enable = false;
    thermald.enable = true;
    printing.enable = true;
    pulseaudio.enable = false;

    xserver = {
      enable = true;

      xkb = {
        layout = "gb";
        variant = "";
      };
    };
  };
}
