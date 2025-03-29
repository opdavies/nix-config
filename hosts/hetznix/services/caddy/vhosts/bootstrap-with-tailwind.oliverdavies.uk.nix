{
  services.caddy.virtualHosts."bootstrap-with-tailwind.oliverdavies.uk" = {
    useACMEHost = "oliverdavies.uk";

    extraConfig = ''
      encode gzip
      root * /var/www/vhosts/bootstrap-with-tailwind.oliverdavies.uk
      file_server
      header X-Robots-Tag "noindex, nofollow"
    '';
  };
}
