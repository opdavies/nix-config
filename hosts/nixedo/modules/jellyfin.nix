{ config, lib, ... }:

with lib;

let
  cfg = homelab.services.${service};
  homelab = config.features.homelab;
  service = "jellyfin";
in
{
  options.features.homelab.services.${service} = {
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

        configDir = "/mnt/media/${service}";
        group = "media";
        openFirewall = true;
      };

      nginx.virtualHosts."${cfg.url}" = {
        forceSSL = true;
        useACMEHost = homelab.baseDomain;

        locations."/" = {
          proxyPass = "http://localhost:8096";
          recommendedProxySettings = true;

          extraConfig = ''
            proxy_buffering off;
          '';
        };
      };
    };
  };
}
