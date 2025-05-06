{ pkgs, ... }:

{
  services.cron = {
    enable = true;

    systemCronJobs = [
      "0 8,20 * * * opdavies ${pkgs.isync}/bin/mbsync -a"
    ];
  };
}
