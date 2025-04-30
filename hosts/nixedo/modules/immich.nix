{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = homelab.services.${service};
  homelab = config.nixosModules.homelab;
  service = "immich";
in
{
  options.nixosModules.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    url = mkOption {
      default = "photos.${homelab.baseDomain}";
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
