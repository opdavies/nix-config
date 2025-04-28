{ config, ... }:

let
  sites = import ./sites.nix;
in
{
  services = {
    nginx = {
      enable = true;

      virtualHosts = builtins.listToAttrs (
        map (site: {
          name = site.url;

          value = {
            root = site.root;

            listen = [
              {
                addr = "localhost";
                port = site.port;
              }
            ];

            locations."/".tryFiles = "$uri $uri/index.html =404";

            extraConfig = builtins.concatStringsSep "\n\n" [
              site.extraConfig or ""

              ''
                port_in_redirect off;

                # Remove trailing slashes.
                rewrite ^/(.*)/$ /$1 permanent;
              ''
            ];
          };
        }) sites
      );
    };

    cloudflared.tunnels."e1514105-327f-4984-974e-e2fbaca76466" = {
      ingress = builtins.listToAttrs (
        map (site: {
          name = site.url;
          value = "http://localhost:${toString site.port}";
        }) sites
      );
    };
  };

  users.users.${config.services.nginx.user}.extraGroups = [ "acme" ];

  imports = [ ./www.oliverdavies.uk.nix ];
}
