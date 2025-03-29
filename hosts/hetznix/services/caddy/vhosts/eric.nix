{
  services.caddy.virtualHosts."eric.oliverdavies.uk" = {
    useACMEHost = "oliverdavies.uk";

    extraConfig = ''
      encode gzip
      root * /var/www/vhosts/eric
      file_server
      header X-Robots-Tag "noindex, nofollow"
    '';
  };
}
