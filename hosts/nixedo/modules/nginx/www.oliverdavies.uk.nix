let
  port = 8095;

  redirects = import ./www.oliverdavies.uk-redirects.nix;

  redirectLines = builtins.concatStringsSep "\n" (
    map (r: "rewrite ^${r.from}/?$ ${r.to} redirect;") redirects
  );

  tomePaths = [
    "core"
    "examples"
    "sites/default/files"
    "themes/custom/opdavies"
    "tome-test"
  ];

  tomeLocations = builtins.listToAttrs (
    map (path: {
      name = "/${path}";

      value = {
        root = "/var/www/vhosts/website-tome";
        tryFiles = "$uri $uri.html $uri/index.html =404";
      };
    }) tomePaths
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

          ${redirectLines}
        '';
      };

      "oliverdavies.uk".globalRedirect = "www.oliverdavies.uk";
    };

    cloudflared.tunnels."e1514105-327f-4984-974e-e2fbaca76466" = {
      ingress = {
        "oliverdavies.uk" = "http://localhost:${toString port}";
        "www.oliverdavies.uk" = "http://localhost:${toString port}";
      };
    };
  };
}
