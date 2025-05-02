{ config, lib, ... }:

with lib;

let
  cfg = homelab.services.${service};
  homelab = config.features.homelab;
  service = "forgejo";
in
{
  options.features.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    url = mkOption {
      default = "code.${homelab.baseDomain}";
      type = types.str;
    };

    cloudflared.tunnelId = mkOption {
      example = "00000000-0000-0000-0000-000000000000";
      type = types.str;
    };

    homepage.name = mkOption {
      default = "Forgejo";
      type = types.str;
    };

    homepage.description = mkOption {
      default = "Beyond coding. We forge.";
      type = types.str;
    };

    homepage.icon = mkOption {
      default = "forgejo";
      type = types.str;
    };

    homepage.category = mkOption {
      default = "Services";
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    services = {
      ${service} = {
        enable = true;
        stateDir = "/var/www/${service}";

        settings = {
          server = {
            DOMAIN = cfg.url;
            ROOT_URL = "https://${cfg.url}";
          };

          service.DISABLE_REGISTRATION = true;
        };
      };

      cloudflared.tunnels.${cfg.cloudflared.tunnelId}.ingress = {
        ${cfg.url} = "http://localhost:${toString config.services.${service}.settings.server.HTTP_PORT}";
      };
    };
  };
}
