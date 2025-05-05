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
  };

  config = mkIf cfg.enable {
    services = {
      ${service} = {
        enable = true;

        configureNginx = true;
        enableWebHttps = false;
        listenWeb = 80;
        localDomain = cfg.url;

        database = {
          createLocally = true;
        };

        redis = {
          createLocally = true;
          enableUnixSocket = true;
        };

        secrets.secretsFile = config.age.secrets.peertube-env.path;
      };

      cloudflared.tunnels.${homelab.cloudflared.tunnelId}.ingress = {
        ${cfg.url} = "http://${toString config.services.${service}.listenWeb}";
      };
    };

    age.secrets."${service}-env" = {
      file = "${inputs.self}/secrets/${service}-env.age";
      owner = config.services.${service}.user;
    };
  };
}
