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
          tomePaths = [
            "core"
            "sites/default/files"
            "themes/custom/opdavies"
            "tome-test"
          ];

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

          redirects = import ./www.oliverdavies.uk-redirects.nix;

          redirectLines = builtins.concatStringsSep "\n" (
            map (r: "redir ${r.from} ${r.to} permanent") redirects
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

          @articles path_regexp ^/articles/(.*)$
          @talks path_regexp ^/talks/(.*)$
          @talks-archive path_regexp ^/talks/archive/(.*)$

          redir @articles /blog/{re.1} permanent
          redir @talks-archive /presentations/{re.1} permanent
          redir @talks /presentations/{re.1} permanent

          ${redirectLines}
        '';
    };
  };
}
