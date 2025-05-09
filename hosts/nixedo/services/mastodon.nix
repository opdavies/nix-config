{ config, lib, ... }:

with lib;

let
  cfg = config.homelab.services.${service};
  domain = "oliverdavies.uk";
  service = "mastodon";
in
{
  options.homelab.services.${service} = {
    url = mkOption {
      default = "social.${domain}";
      internal = true;
      type = types.str;
    };
  };

  config = {
    services = {
      ${service} = {
        enable = false;

        configureNginx = false;
        localDomain = domain;
        streamingProcesses = 3;

        extraConfig = {
          SINGLE_USER_MODE = "true";
          WEB_DOMAIN = cfg.url;
        };

        smtp = {
          fromAddress = "social@${domain}";
        };
      };

      cloudflared.tunnels.${config.homelab.cloudflared.tunnelId} = {
        ingress = {
          "${cfg.url}" = "http://localhost";
        };
      };

      nginx = {
        upstreams.mastodon-streaming = {
          extraConfig = ''
            least_conn;
          '';

          servers = builtins.listToAttrs (
            map (i: {
              name = "unix:/run/mastodon-streaming/streaming-${toString i}.socket";
              value = { };
            }) (range 1 config.services.mastodon.streamingProcesses)
          );
        };

        virtualHosts."social.oliverdavies.uk" = {
          root = "${config.services.mastodon.package}/public/";

          locations = {
            "/".tryFiles = "$uri @proxy";

            "/api/v1/streaming/" = {
              proxyPass = "http://mastodon-streaming";
              proxyWebsockets = true;
            };

            "/system/".alias = "/var/lib/mastodon/public-system/";

            "@proxy" = {
              proxyPass = "http://unix:/run/mastodon-web/web.socket";
              proxyWebsockets = true;
            };
          };

          extraConfig = ''
            client_max_body_size 100m;
          '';
        };
      };
    };
  };
}
