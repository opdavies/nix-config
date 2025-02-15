{ pkgs, ... }:

{
  services.cron = {
    enable = true;

    systemCronJobs = [
      "*/15 * * * * opdavies ${pkgs.imapfilter}/bin/imapfilter -c ~/Code/email-filters/config.lua"
      "0 8,20 * * * opdavies ${pkgs.isync}/bin/mbsync -a"
    ];
  };
}
