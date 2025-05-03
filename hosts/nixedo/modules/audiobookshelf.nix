{ config, lib, ... }:

with lib;

let
  cfg = homelab.services.${service};
  homelab = config.features.homelab;
  service = "audiobookshelf";
in
{
  options.features.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    url = mkOption {
      default = "audiobookshelf.${homelab.domain}";
      type = types.str;
    };

    homepage.name = mkOption {
      default = "Audiobookshelf";
      type = types.str;
    };

    homepage.description = mkOption {
      default = "Self-hosted audiobook and podcast server";
      type = types.str;
    };

    homepage.icon = mkOption {
      default = "audiobookshelf";
      type = types.str;
    };

    homepage.category = mkOption {
      default = "Media";
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    services = {
      ${service}.enable = true;

      nginx.virtualHosts.${cfg.url} = {
        forceSSL = true;
        useACMEHost = homelab.domain;

        locations."/" = {
          proxyPass = "http://localhost:${toString config.services.${service}.port}";
          recommendedProxySettings = true;
        };
      };
    };
  };
}
