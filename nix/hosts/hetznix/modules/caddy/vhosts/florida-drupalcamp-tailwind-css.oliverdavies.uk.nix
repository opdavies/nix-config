{
  services.caddy.virtualHosts."florida-drupalcamp-tailwind-css.oliverdavies.uk" = {
    useACMEHost = "oliverdavies.uk";

    extraConfig = ''
      encode gzip
      root * /var/www/vhosts/florida-drupalcamp-tailwind-css.oliverdavies.uk
      file_server
      header X-Robots-Tag "noindex, nofollow"
    '';
  };
}
