{ config, pkgs, ... }:

let
  ports = config.homelab.ports;
in
{
  services.mealie = {
    enable = true;
    package = pkgs.stable.mealie;

    database.createLocally = true;

    port = ports.mealie;

    settings.ALLOW_SIGNUP = "false";
  };

  services.nginx.virtualHosts."mealie.oliverdavies.uk" = {
    forceSSL = true;
    useACMEHost = "oliverdavies.uk";

    locations."/" = {
      proxyPass = "http://localhost:${toString config.services.mealie.port}";
      recommendedProxySettings = true;
    };
  };
}
