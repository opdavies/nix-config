{ config, lib, ... }:

with lib;

{
  options.features.homelab.forgejo.enable = mkEnableOption "Enable forgejo";

  config = mkIf config.features.homelab.forgejo.enable {
    services = {
      forgejo = {
        enable = true;
        group = "media";
        stateDir = "/mnt/media/forgejo";

        settings = {
          server = {
            DOMAIN = "forgejo.opdavies.uk";
            HTTP_PORT = 2223;
          };

          service = {
            DISABLE_REGISTRATION = true;
          };
        };
      };

      caddy.virtualHosts."${config.services.forgejo.settings.server.DOMAIN}" = {
        useACMEHost = "opdavies.uk";

        extraConfig = "reverse_proxy localhost:${toString config.services.forgejo.settings.server.HTTP_PORT}";
      };
    };
  };
}
