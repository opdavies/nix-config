{ config, lib, ... }:

with lib;

let
  cfg = homelab.services.paperless;
  homelab = config.features.homelab;
  service = "paperless";
in
{
  options.features.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    url = mkOption {
      default = "${service}.${homelab.baseDomain}";
      type = types.str;
    };

    homepage.name = mkOption {
      default = "Paperless-ngx";
      type = types.str;
    };

    homepage.description = mkOption {
      default = "Document management system";
      type = types.str;
    };

    homepage.icon = mkOption {
      default = "paperless";
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

        dataDir = "/mnt/media/${service}";

        settings = {
          PAPERLESS_URL = "https://${cfg.url}";
        };
      };

      nginx.virtualHosts."${cfg.url}" = {
        forceSSL = true;
        useACMEHost = homelab.baseDomain;

        locations."/" = {
          proxyPass = "http://localhost:${toString config.services.${service}.port}";
          recommendedProxySettings = true;
        };
      };
    };
  };
}
