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
        let
          tomePaths = [ "tome-test" ];

          tomeConfig = builtins.concatStringsSep "\n\n" (
            builtins.map (path: ''
              handle /${path} {
                root * /var/www/vhosts/www.oliverdavies.uk-tome
                file_server
              }

              handle_path /${path}/* {
                root * /var/www/vhosts/www.oliverdavies.uk-tome/${path}
                file_server
              }
            '') tomePaths
          );
        in
        ''
          encode gzip
          file_server
          root * /var/www/vhosts/www.oliverdavies.uk-sculpin

          handle_errors {
            @404 {
              expression {http.error.status_code} == 404
            }

            rewrite @404 /404/index.html
            file_server
          }

          ${tomeConfig}
        ''
        + builtins.readFile ./www.oliverdavies.uk-redirects.caddy;
    };
  };
}
