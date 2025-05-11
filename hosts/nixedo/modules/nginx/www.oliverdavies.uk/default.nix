{ config, ... }:

let
  ports = config.homelab.ports;
  port = ports.nginx-website-sculpin;

  redirects = builtins.concatStringsSep "\n" (
    map (r: "rewrite ^${r.from}/?$ ${r.to} redirect;") (import ./redirects.nix)
  );

  tome = {
    root = "/var/www/vhosts/website-tome";

    paths = [
      "archive"
      "core"
      "daily/.+"
      "examples"
      "homelab"
      "sites/default/files"
      "themes/custom/opdavies"
      "tome-test"
    ];

    port = ports.nginx-website-tome;
  };

  tomeLocations = builtins.listToAttrs (
    map (path: {
      name = "~ ^/${path}";

      value = {
        root = tome.root;
        tryFiles = "$uri $uri.html $uri/index.html =404";
      };
    }) tome.paths
  );
in
{
  services = {
    nginx.virtualHosts = {
      "www.oliverdavies.uk" = {
        root = "/var/www/vhosts/website-sculpin";

        listen = [
          {
            inherit port;

            addr = "localhost";
          }
        ];

        locations = tomeLocations // {
          "/".tryFiles = "$uri $uri.html $uri/index.html =404";
        };

        extraConfig = ''
          port_in_redirect off;

          # Remove trailing slashes.
          rewrite ^/(.*)/$ /$1 permanent;

          error_page 404 /404;

          rewrite ^/talks/archive/?$ /talks permanent;
          rewrite ^/talks/(.*)$ /presentations/$1 permanent;
          rewrite ^/talks/?$ /presentations permanent;

          ${redirects}
        '';
      };

      "oliverdavies.uk" = {
        forceSSL = true;
        globalRedirect = "www.oliverdavies.uk";
        useACMEHost = "oliverdavies.uk";
      };

      "tome.oliverdavies.uk" = {
        listen = [
          {
            addr = "localhost";
            port = tome.port;
          }
        ];

        locations."/".tryFiles = "$uri $uri.html $uri/index.html =404";

        root = tome.root;

        extraConfig = ''
          add_header X-Robots-Tag "noindex, nofollow";

          port_in_redirect off;

          # Remove trailing slashes.
          rewrite ^/(.*)/$ /$1 permanent;
        '';
      };
    };

    cloudflared.tunnels."e1514105-327f-4984-974e-e2fbaca76466" = {
      ingress = {
        "oliverdavies.uk" = "http://localhost:${toString port}";
        "tome.oliverdavies.uk" = "http://localhost:${toString tome.port}";
        "www.oliverdavies.uk" = "http://localhost:${toString port}";
      };
    };
  };
}
