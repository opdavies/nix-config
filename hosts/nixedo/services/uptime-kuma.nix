{ config, ... }:

{
  services = {
    uptime-kuma.enable = true;

    nginx.virtualHosts."uptime.oliverdavies.uk" = {
      forceSSL = true;
      useACMEHost = "oliverdavies.uk";

      locations."/" = {
        proxyPass = "http://localhost:${toString config.services.uptime-kuma.settings.PORT}";
        recommendedProxySettings = true;
      };
    };
  };
}
