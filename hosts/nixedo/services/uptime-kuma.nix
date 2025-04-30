{ config, lib, ... }:

with lib;

let
  cfg = homelab.services.${service};
  homelab = config.features.homelab;
  service = "uptime-kuma";
in
{
  options.features.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    url = mkOption {
      default = "uptime.${homelab.baseDomain}";
      type = types.str;
    };

    homepage.name = mkOption {
      default = "Uptime Kuma";
      type = types.str;
    };

    homepage.description = mkOption {
      default = "A fancy self-hosted monitoring tool";
      type = types.str;
    };

    homepage.icon = mkOption {
      default = "uptime-kuma";
      type = types.str;
    };

    homepage.category = mkOption {
      default = "Services";
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    services = {
      ${service}.enable = true;

      nginx.virtualHosts.${cfg.url} = {
        forceSSL = true;
        useACMEHost = homelab.baseDomain;

        locations."/" = {
          proxyPass = "http://localhost:${toString config.services.${service}.settings.PORT}";
          recommendedProxySettings = true;
        };
      };
    };
  };
}
