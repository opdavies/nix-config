{ config, ... }:

{
  services = {
    paperless = {
      enable = true;

      dataDir = "/mnt/media/paperless";

      settings = {
        PAPERLESS_URL = "https://paperless.oliverdavies.uk";
      };
    };

    caddy.virtualHosts."${config.services.paperless.settings.PAPERLESS_URL}" = {
      useACMEHost = "oliverdavies.uk";

      extraConfig = "reverse_proxy localhost:28981";
    };
  };
}
