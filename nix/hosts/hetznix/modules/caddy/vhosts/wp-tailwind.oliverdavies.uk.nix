{
  services.caddy.virtualHosts."wp-tailwind.oliverdavies.uk" = {
    useACMEHost = "oliverdavies.uk";

    extraConfig = ''
      encode gzip
      root * /var/www/vhosts/wp-tailwind.oliverdavies.uk
      file_server
      header X-Robots-Tag "noindex, nofollow"
    '';
  };
}
