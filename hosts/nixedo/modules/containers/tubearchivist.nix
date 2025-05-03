{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = homelab.services.${service};
  service = "tubearchivist";
  homelab = config.features.homelab;
in
{
  options.features.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";

    port = mkOption {
      default = 8099;
      type = types.port;
    };

    url = mkOption {
      default = "${service}.${homelab.domain}";
      type = types.str;
    };

    homepage.name = mkOption {
      default = "Tube Archivist";
      type = types.str;
    };

    homepage.description = mkOption {
      default = "Your self hosted YouTube media server";
      type = types.str;
    };

    homepage.icon = mkOption {
      default = "tube-archivist";
      type = types.str;
    };

    homepage.category = mkOption {
      default = "Media";
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    virtualisation = {
      oci-containers.backend = "podman";
      podman.enable = true;
    };

    virtualisation.oci-containers.containers."archivist-es" = {
      image = "bbilly1/tubearchivist-es";

      environment = {
        "ES_JAVA_OPTS" = "-Xms1g -Xmx1g";
        "discovery.type" = "single-node";
        "path.repo" = "/usr/share/elasticsearch/data/snapshot";
        "xpack.security.enabled" = "true";
        "cluster.routing.allocation.disk.watermark.flood_stage" = "98%";
        "cluster.routing.allocation.disk.watermark.high" = "97%";
        "cluster.routing.allocation.disk.watermark.low" = "95%";
      };

      environmentFiles = [
        config.age.secrets.tubearchivist-env.path
      ];

      volumes = [
        "tubearchivist_es:/usr/share/elasticsearch/data:rw"
      ];

      log-driver = "journald";

      extraOptions = [
        "--network-alias=archivist-es"
        "--network=tubearchivist_default"
      ];
    };

    systemd.services."podman-archivist-es" = {
      serviceConfig = {
        Restart = mkOverride 90 "always";
        RestartMaxDelaySec = mkOverride 90 "1m";
        RestartSec = mkOverride 90 "100ms";
        RestartSteps = mkOverride 90 9;
      };

      after = [
        "podman-network-tubearchivist_default.service"
        "podman-volume-tubearchivist_es.service"
      ];

      requires = [
        "podman-network-tubearchivist_default.service"
        "podman-volume-tubearchivist_es.service"
      ];

      partOf = [
        "podman-compose-tubearchivist-root.target"
      ];

      wantedBy = [
        "podman-compose-tubearchivist-root.target"
      ];
    };

    virtualisation.oci-containers.containers."archivist-redis" = {
      image = "redis";

      volumes = [
        "tubearchivist_redis:/data:rw"
      ];

      dependsOn = [
        "archivist-es"
      ];

      log-driver = "journald";

      extraOptions = [
        "--network-alias=archivist-redis"
        "--network=tubearchivist_default"
      ];
    };

    systemd.services."podman-archivist-redis" = {
      serviceConfig = {
        Restart = mkOverride 90 "always";
        RestartMaxDelaySec = mkOverride 90 "1m";
        RestartSec = mkOverride 90 "100ms";
        RestartSteps = mkOverride 90 9;
      };

      after = [
        "podman-network-tubearchivist_default.service"
        "podman-volume-tubearchivist_redis.service"
      ];

      requires = [
        "podman-network-tubearchivist_default.service"
        "podman-volume-tubearchivist_redis.service"
      ];

      partOf = [
        "podman-compose-tubearchivist-root.target"
      ];

      wantedBy = [
        "podman-compose-tubearchivist-root.target"
      ];
    };

    virtualisation.oci-containers.containers."tubearchivist" = {
      image = "bbilly1/tubearchivist";

      environment = {
        "ES_URL" = "http://archivist-es:9200";
        "HOST_GID" = "1000";
        "HOST_UID" = "1000";
        "REDIS_CON" = "redis://archivist-redis:6379";
        "TA_HOST" = "https://${cfg.url}";
        "TZ" = "Europe/London";
      };

      environmentFiles = [
        config.age.secrets.tubearchivist-env.path
      ];

      volumes = [
        "/mnt/media/${service}/cache:/cache:rw"
        "/mnt/media/${service}/media:/youtube:rw"
      ];

      ports = [
        "${toString cfg.port}:8000/tcp"
      ];

      dependsOn = [
        "archivist-es"
        "archivist-redis"
      ];

      log-driver = "journald";

      extraOptions = [
        "--health-cmd=[\"curl\", \"-f\", \"http://localhost:8000/health\"]"
        "--health-interval=2m0s"
        "--health-retries=3"
        "--health-start-period=30s"
        "--health-timeout=10s"
        "--network-alias=tubearchivist"
        "--network=tubearchivist_default"
      ];
    };

    systemd.services."podman-tubearchivist" = {
      serviceConfig = {
        Restart = mkOverride 90 "always";
        RestartMaxDelaySec = mkOverride 90 "1m";
        RestartSec = mkOverride 90 "100ms";
        RestartSteps = mkOverride 90 9;
      };

      after = [
        "podman-network-tubearchivist_default.service"
        "podman-volume-tubearchivist_cache.service"
        "podman-volume-tubearchivist_media.service"
      ];

      requires = [
        "podman-network-tubearchivist_default.service"
        "podman-volume-tubearchivist_cache.service"
        "podman-volume-tubearchivist_media.service"
      ];

      partOf = [
        "podman-compose-tubearchivist-root.target"
      ];

      wantedBy = [
        "podman-compose-tubearchivist-root.target"
      ];
    };

    systemd.services."podman-network-tubearchivist_default" = {
      path = [ pkgs.podman ];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStop = "podman network rm -f tubearchivist_default";
      };

      script = ''
        podman network inspect tubearchivist_default || podman network create tubearchivist_default
      '';

      partOf = [ "podman-compose-tubearchivist-root.target" ];
      wantedBy = [ "podman-compose-tubearchivist-root.target" ];
    };

    systemd.services."podman-volume-tubearchivist_cache" = {
      path = [ pkgs.podman ];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };

      script = ''
        podman volume inspect tubearchivist_cache || podman volume create tubearchivist_cache
      '';

      partOf = [ "podman-compose-tubearchivist-root.target" ];
      wantedBy = [ "podman-compose-tubearchivist-root.target" ];
    };

    systemd.services."podman-volume-tubearchivist_es" = {
      path = [ pkgs.podman ];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };

      script = ''
        podman volume inspect tubearchivist_es || podman volume create tubearchivist_es
      '';

      partOf = [ "podman-compose-tubearchivist-root.target" ];
      wantedBy = [ "podman-compose-tubearchivist-root.target" ];
    };

    systemd.services."podman-volume-tubearchivist_media" = {
      path = [ pkgs.podman ];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };

      script = ''
        podman volume inspect tubearchivist_media || podman volume create tubearchivist_media
      '';

      partOf = [ "podman-compose-tubearchivist-root.target" ];
      wantedBy = [ "podman-compose-tubearchivist-root.target" ];
    };

    systemd.services."podman-volume-tubearchivist_redis" = {
      path = [ pkgs.podman ];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };

      script = ''
        podman volume inspect tubearchivist_redis || podman volume create tubearchivist_redis
      '';

      partOf = [ "podman-compose-tubearchivist-root.target" ];
      wantedBy = [ "podman-compose-tubearchivist-root.target" ];
    };

    systemd.targets."podman-compose-tubearchivist-root" = {
      unitConfig = {
        Description = "Root target generated by compose2nix.";
      };

      wantedBy = [ "multi-user.target" ];
    };

    services.nginx.virtualHosts."${cfg.url}" = {
      forceSSL = true;
      useACMEHost = homelab.domain;

      locations."/" = {
        proxyPass = "http://localhost:${toString cfg.port}";
        recommendedProxySettings = true;
        proxyWebsockets = true;

        extraConfig = ''
          proxy_buffering off;
        '';
      };
    };
  };
}
