{ config, lib, ... }:

with lib;

let
  cfg = homelab.services.${service};
  homelab = config.homelab;
  service = "homepage-dashboard";
in
{
  options.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    url = mkOption {
      default = "${config.networking.hostName}.${homelab.domain}";
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    services = {
      ${service} = {
        enable = true;
        listenPort = homelab.ports.${service};
        openFirewall = true;

        customCSS = ''
          #information-widgets {
            padding-left: 1.5rem;
            padding-right: 1.5rem;
          }

          div#footer {
            display: none;
          }

          .services-group {
            margin-bottom: 3rem;
          }
        '';

        services = (import ./services.nix { inherit config lib; });

        settings = {
          headerStyle = "clean";
          hideVersion = "true";
          layout = (import ./layout.nix);
          statusStyle = "dot";
        };
      };

      glances.enable = true;

      nginx.virtualHosts.${cfg.url} = {
        forceSSL = true;
        useACMEHost = homelab.domain;

        locations."/".proxyPass =
          "http://localhost:${toString config.services.homepage-dashboard.listenPort}";
      };
    };
  };
}
