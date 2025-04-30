{
  config,
  lib,
  options,
  ...
}:

with lib;

let
  cfg = homelab.services.${service};
  homelab = config.features.homelab;
  opts = options.services.${service};
  service = "homepage-dashboard";
in
{
  options.features.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    port = mkOption {
      default = opts.listenPort.default;
      type = types.port;
    };

    url = mkOption {
      default = "${config.networking.hostName}.${homelab.baseDomain}";
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    services = {
      ${service} = {
        enable = true;
        listenPort = cfg.port;
        openFirewall = true;

        services = (import ./services.nix { inherit config; });
        widgets = import ./widgets.nix;
      };

      nginx.virtualHosts.${cfg.url} = {
        forceSSL = true;
        useACMEHost = homelab.baseDomain;

        locations."/".proxyPass =
          "http://localhost:${toString config.services.homepage-dashboard.listenPort}";
      };
    };
  };
}
