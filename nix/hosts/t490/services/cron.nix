{ pkgs, ... }:

{
  services.cron = {
    enable = true;

    systemCronJobs = [
      "* * * * * opdavies ${pkgs.imapfilter}/bin/imapfilter -c ~/Code/email-filters/config.lua"
    ];
  };
}
