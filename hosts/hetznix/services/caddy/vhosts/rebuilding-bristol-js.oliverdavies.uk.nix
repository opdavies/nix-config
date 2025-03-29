{
  services.caddy.virtualHosts."rebuilding-bristol-js.oliverdavies.uk" = {
    useACMEHost = "oliverdavies.uk";

    extraConfig = ''
      encode gzip
      root * /var/www/vhosts/rebuilding-bristol-js.oliverdavies.uk
      file_server
      header X-Robots-Tag "noindex, nofollow"
    '';
  };
}
