{
  config,
  inputs,
  lib,
  ...
}:

let
  inherit (lib)
    mkEnableOption
    mkIf
    mkOption
    types
    ;

  cfg = homelab.services.${service};
  homelab = config.homelab;
  service = "peertube";
in
{
  options.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    url = mkOption {
      default = "videos.${homelab.domain}";
      type = types.str;
    };

    homepage.name = mkOption {
      default = "Peertube";
      type = types.str;
    };

    homepage.description = mkOption {
      default = "A free and open-source, decentralized, ActivityPub federated video platform";
      type = types.str;
    };

    homepage.icon = mkOption {
      default = "peertube";
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

        configureNginx = true;
        enableWebHttps = false;
        localDomain = cfg.url;

        database = {
          createLocally = true;
        };

        redis = {
          createLocally = true;
          enableUnixSocket = true;
        };

        secrets.secretsFile = config.age.secrets.peertube-env.path;

        settings = {
          webserver = {
            hostname = config.services.${service}.localDomain;
            port = lib.mkForce 443;
          };
        };
      };

      cloudflared.tunnels.${homelab.cloudflared.tunnelId}.ingress = {
        ${cfg.url} = "http://localhost:${toString config.services.${service}.listenWeb}";
      };
    };

    age.secrets."${service}-env" = {
      file = "${inputs.self}/secrets/${service}-env.age";
      owner = config.services.${service}.user;
    };
  };
}
