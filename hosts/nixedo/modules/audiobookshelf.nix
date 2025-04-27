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
