{ config, lib, ... }:

with lib;

let
  cfg = homelab.services.${service};
  homelab = config.nixosModules.homelab;
  service = "audiobookshelf";
in
{
  options.nixosModules.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    url = mkOption {
      default = "audiobookshelf.${homelab.baseDomain}";
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
          proxyPass = "http://localhost:${toString cfg.port}";
          recommendedProxySettings = true;
        };
      };
    };
  };
}
