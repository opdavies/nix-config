{ config, lib, ... }:

with lib;

let
  cfg = homelab.services.${service};
  homelab = config.nixosModules.homelab;
  service = "forgejo";
in
{
  options.nixosModules.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    cloudflared.tunnelId = mkOption {
      example = "00000000-0000-0000-0000-000000000000";
      type = types.str;
    };

    url = mkOption {
      default = "code.${homelab.baseDomain}";
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    services = {
      ${service} = {
        enable = true;
        stateDir = "/var/www/${service}";

        settings = {
          server.DOMAIN = cfg.url;
          service.DISABLE_REGISTRATION = true;
        };
      };

      cloudflared.tunnels.${cfg.cloudflared.tunnelId}.ingress = {
        ${cfg.url} = "http://localhost:${toString config.services.${service}.settings.server.HTTP_PORT}";
      };
    };
  };
}
