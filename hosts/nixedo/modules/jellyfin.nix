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
      default = "${service}.${homelab.domain}";
      type = types.str;
    };

    homepage.name = mkOption {
      default = "Jellyfin";
      type = types.str;
    };

    homepage.description = mkOption {
      default = "The Free Software Media System";
      type = types.str;
    };

    homepage.icon = mkOption {
      default = "jellyfin";
      type = types.str;
    };

    homepage.category = mkOption {
      default = "Media";
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
        useACMEHost = homelab.domain;

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
