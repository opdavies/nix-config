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
      default = "${service}.${homelab.baseDomain}";
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
          ROCKET_PORT = 8222;
          SIGNUPS_ALLOWED = false;
        };
      };

      nginx.virtualHosts.${cfg.url} = {
        forceSSL = true;
        useACMEHost = homelab.baseDomain;

        locations."/" = {
          proxyPass = "http://localhost:${toString config.services.${service}.config.ROCKET_PORT}";
          recommendedProxySettings = true;
        };
      };
    };
  };
}
