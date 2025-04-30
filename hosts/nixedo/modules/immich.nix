{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = homelab.services.${service};
  homelab = config.features.homelab;
  service = "immich";
in
{
  options.features.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    url = mkOption {
      default = "photos.${homelab.baseDomain}";
      type = types.str;
    };

    homepage.name = mkOption {
      default = "Immich";
      type = types.str;
    };

    homepage.description = mkOption {
      default = "Self-hosted photo and video management solution";
      type = types.str;
    };

    homepage.icon = mkOption {
      default = "immich";
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
        group = "media";
        mediaLocation = "/mnt/media/${service}";
      };

      nginx.virtualHosts."${cfg.url}" = {
        forceSSL = true;
        useACMEHost = homelab.baseDomain;

        locations."/" = {
          proxyPass = "http://localhost:${toString config.services.immich.port}";
          proxyWebsockets = true;
          recommendedProxySettings = true;
        };
      };
    };

    environment.systemPackages = with pkgs; [
      immich-cli
      immich-go
    ];
  };
}
