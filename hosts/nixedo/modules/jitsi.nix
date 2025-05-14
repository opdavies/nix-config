{ config, lib, ... }:

let
  cfg = config.homelab.services.${service};
  homelab = config.homelab;
  service = "jitsi";

  inherit (lib) mkEnableOption mkOption types;
in
{
  options.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    url = mkOption {
      default = "meet.${homelab.domain}";
      type = types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      jitsi-meet = {
        enable = false;

        hostName = cfg.url;

        secureDomain.enable = true;
      };

      nginx.virtualHosts.${cfg.url} = {
        enableACME = false;
        forceSSL = false;
      };

      cloudflared.tunnels.${homelab.cloudflared.tunnelId}.ingress = {
        # TODO: is this the correct port?
        ${cfg.url} = "http://localhost:5280";
      };
    };
  };
}
