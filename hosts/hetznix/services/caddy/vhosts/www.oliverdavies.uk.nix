{
  services.caddy.virtualHosts = {
    "oliverdavies.uk" = {
      useACMEHost = "oliverdavies.uk";

      extraConfig = ''
        redir https://www.oliverdavies.uk{uri}
      '';
    };

    "www.oliverdavies.uk" = {
      useACMEHost = "oliverdavies.uk";

      extraConfig =
        ''
          encode gzip

          root * /var/www/vhosts/www.oliverdavies.uk

          file_server {
            disable_canonical_uris
          }

          # Remove trailing slashes from all URLs.
          @trailingSlash {
            path_regexp trailingSlash ^(.*)/$
            not path /
          }
          redir @trailingSlash {http.regexp.trailingSlash.1} temporary

          handle_errors {
            @404 {
              expression {http.error.status_code} == 404
            }

            rewrite @404 /404/index.html
            file_server
          }
        ''
        + builtins.readFile ./www.oliverdavies.uk-redirects.caddy;
    };
  };
}
