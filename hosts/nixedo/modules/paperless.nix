{ config, lib, ... }:

with lib;

let
  cfg = homelab.services.paperless;
  homelab = config.nixosModules.homelab;
  service = "paperless";
in
{
  options.nixosModules.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    url = mkOption {
      default = "${service}.${homelab.baseDomain}";
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
