{ config, lib, ... }:

with lib;

let
  cfg = homelab.services.${service};
  homelab = config.nixosModules.homelab;
  service = "uptime-kuma";
in
{
  options.nixosModules.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    url = mkOption {
      default = "uptime.${homelab.baseDomain}";
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
