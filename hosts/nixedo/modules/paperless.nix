{ config, ... }:

{
  services =
    let
      cfg = config.services.paperless;
      hostname = "paperless.oliverdavies.uk";
    in
    {
      paperless = {
        enable = true;

        dataDir = "/mnt/media/paperless";

        settings = {
          PAPERLESS_URL = "https://${hostname}";
        };
      };

      nginx.virtualHosts."${hostname}" = {
        forceSSL = true;
        useACMEHost = "oliverdavies.uk";

        locations."/" = {
          proxyPass = "http://localhost:${toString cfg.port}";
          recommendedProxySettings = true;
        };
      };
    };
}
