{
  config,
  lib,
  options,
  ...
}:

with lib;

let
  cfg = homelab.services.${service};
  homelab = config.features.homelab;
  service = "vaultwarden";
in
{
  options.features.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    url = mkOption {
      default = "${service}.${homelab.domain}";
      type = types.str;
    };

    cloudflared.tunnelId = mkOption {
      example = "00000000-0000-0000-0000-000000000000";
      type = types.str;
    };

    homepage.name = mkOption {
      default = "Vaultwarden";
      type = types.str;
    };

    homepage.description = mkOption {
      default = "Unofficial Bitwarden compatible server written in Rust";
      type = types.str;
    };

    homepage.icon = mkOption {
      default = "bitwarden";
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

        config = {
          DOMAIN = "https://${cfg.url}";
          ROCKET_ADDRESS = "127.0.0.1";
          ROCKET_PORT = 8222;
          SIGNUPS_ALLOWED = false;
        };
      };

      cloudflared.tunnels.${cfg.cloudflared.tunnelId} = {
        credentialsFile = config.age.secrets.cloudflared.path;
        default = "http_status:404";
        ingress."${cfg.url}".service = "http://${config.services.${service}.config.ROCKET_ADDRESS}:${
          toString config.services.${service}.config.ROCKET_PORT
        }";
      };
    };
  };
}
