{ config, lib, ... }:

with lib;

let
  cfg = homelab.services.${service};
  homelab = config.homelab;
  service = "home-assistant";
in
{
  options.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    url = mkOption {
      default = "home.${homelab.domain}";
      type = types.str;
    };

    homepage.name = mkOption {
      default = "Home Assisant";
      type = types.str;
    };

    homepage.description = mkOption {
      default = "Open source home automation that puts local control and privacy first.";
      type = types.str;
    };

    homepage.icon = mkOption {
      default = "home-assistant";
      type = types.str;
    };

    homepage.category = mkOption {
      default = "Services";
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    services = {
      home-assistant = {
        enable = true;

        config = {
          external_url = "https://home.${homelab.domain}";
          name = "Home";
          time_zone = "Europe/London";
          unit_system = "metric";

          http = {
            trusted_proxies = [
              "127.0.0.1"
              "::1"
            ];
            use_x_forwarded_for = true;
          };

          mobile_app = { };
          # sia = { };
        };

        extraComponents = [
          "default_config"
          "elgato"
          "hive"
          "met"
          "mobile_app"
          # "sia"
          "weather"
          "webostv"
        ];

        extraPackages =
          python3Packages: with python3Packages; [
            setuptools
          ];

        openFirewall = true;
      };

      nginx.virtualHosts."${cfg.url}" = {
        forceSSL = true;
        useACMEHost = homelab.domain;

        locations."/" = {
          proxyPass = "http://localhost:${toString config.services.${service}.config.http.server_port}";
          proxyWebsockets = true;
          recommendedProxySettings = true;
        };
      };
    };
  };
}
