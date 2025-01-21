{ config, lib, ... }:

with lib;

let
  url = "paperless.oliverdavies.uk";
in
{
  options.features.homelab.paperless.enable = mkEnableOption "Enable paperless";

  config = mkIf config.features.homelab.paperless.enable {
    services = {
      paperless = {
        enable = true;

        dataDir = "/mnt/media/paperless";

        settings = {
          PAPERLESS_URL = "https://${url}";
        };
      };

      caddy.virtualHosts."${url}" = {
        useACMEHost = "oliverdavies.uk";

        extraConfig = "reverse_proxy localhost:28981";
      };
    };
  };
}
