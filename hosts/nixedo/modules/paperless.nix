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

          extraConfig = ''
            proxy_set_header Host $host;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Host $http_host;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_set_header X-Forwarded-Protocol $scheme;
            proxy_set_header X-Real-IP $remote_addr;
          '';
        };
      };
    };
}
