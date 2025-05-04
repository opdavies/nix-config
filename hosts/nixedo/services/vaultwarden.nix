{
  config,
  lib,
  options,
  ...
}:

with lib;

let
  cfg = homelab.services.${service};
  homelab = config.homelab;
  service = "vaultwarden";
in
{
  options.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    url = mkOption {
      default = "${service}.${homelab.domain}";
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
          ROCKET_PORT = homelab.ports.${service};
          SIGNUPS_ALLOWED = false;
        };
      };

      cloudflared.tunnels.${homelab.cloudflared.tunnelId}.ingress = {
        "${cfg.url}" = "http://${config.services.${service}.config.ROCKET_ADDRESS}:${
          toString config.services.${service}.config.ROCKET_PORT
        }";
      };
    };
  };
}
