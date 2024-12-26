{
  services.caddy.virtualHosts."rebuilding-symfony.oliverdavies.uk" = {
    useACMEHost = "oliverdavies.uk";

    extraConfig = ''
      encode gzip
      root * /var/www/vhosts/rebuilding-symfony.oliverdavies.uk
      file_server
      header X-Robots-Tag "noindex, nofollow"
    '';
  };
}
