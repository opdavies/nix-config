{
  services.caddy.virtualHosts."luke.oliverdavies.uk" = {
    useACMEHost = "oliverdavies.uk";

    extraConfig = ''
      encode gzip
      root * /var/www/vhosts/luke.oliverdavies.uk
      file_server
      header X-Robots-Tag "noindex, nofollow"
    '';
  };
}
