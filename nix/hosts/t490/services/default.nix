{ username, ... }:

{
  imports = [
    ./interception-tools.nix
    ./sound.nix
    ./xserver.nix
    ./udev.nix
  ];

  services = {
    auto-cpufreq.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    blueman.enable = true;

    cron = {
      enable = true;

      systemCronJobs = [ "* * * * * opdavies /home/${username}/.local/bin/notify-battery" ];
    };

    gvfs.enable = true;
    openssh.enable = true;
    power-profiles-daemon.enable = false;
    printing.enable = true;
    throttled.enable = true;
    thermald.enable = true;
  };
}
