{ config, lib, ... }:

with lib;

{
  options.features.homelab.paperless.enable = mkEnableOption "Enable paperless";

  config = mkIf config.features.homelab.paperless.enable {
    services = {
      paperless = {
        enable = true;

        dataDir = "/mnt/media/paperless";

        settings = {
          PAPERLESS_URL = "https://paperless.opdavies.uk";
        };
      };

      caddy.virtualHosts."paperless.opdavies.uk" = {
        useACMEHost = "opdavies.uk";

        extraConfig = "reverse_proxy localhost:28981";
      };
    };
  };
}
