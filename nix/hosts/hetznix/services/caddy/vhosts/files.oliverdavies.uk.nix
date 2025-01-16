{
  services.caddy.virtualHosts."files.oliverdavies.uk" = {
    useACMEHost = "oliverdavies.uk";

    extraConfig = ''
      file_server {
        header Content-Disposition "attachment"
      }

      root * /var/www/vhosts/files.oliverdavies.uk

      header X-Robots-Tag "noindex, nofollow"
    '';
  };
}
