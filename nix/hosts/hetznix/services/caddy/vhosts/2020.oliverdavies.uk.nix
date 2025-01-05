{
  services.caddy.virtualHosts."2020.oliverdavies.uk" = {
    useACMEHost = "oliverdavies.uk";

    extraConfig = ''
      encode gzip

      root * /var/www/vhosts/2020.oliverdavies.uk

      file_server

      header X-Robots-Tag "noindex, nofollow"
    '';
  };
}
