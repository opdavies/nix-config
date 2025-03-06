{ config, lib, ... }:

with lib;

let
  url = "paperless.oliverdavies.uk";
in
{
  options.nixosModules.paperless.enable = mkEnableOption "Enable paperless";

  config = mkIf config.nixosModules.paperless.enable {
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
