{ config, ... }:

let
  cfg = config.services.audiobookshelf;
in
{
  services = {
    audiobookshelf = {
      enable = true;

      port = 4001;
    };

    nginx.virtualHosts."audiobookshelf.oliverdavies.uk" = {
      forceSSL = true;
      useACMEHost = "oliverdavies.uk";

      locations."/" = {
        proxyPass = "http://localhost:${toString cfg.port}";
        recommendedProxySettings = true;
      };
    };
  };
}
