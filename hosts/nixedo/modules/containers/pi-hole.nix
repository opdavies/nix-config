{ lib, ... }:

let
  port = 8082;
in
{
  virtualisation.oci-containers.containers."pihole" = {
    image = "pihole/pihole:latest";

    environment = {
      PIHOLE_DNS_1 = "8.8.8.8";
      PIHOLE_DNS_2 = "8.8.4.4";
      TZ = "Europe/London";
    };

    volumes = [
      "/home/opdavies/pihole/etc-dnsmasq.d:/etc/dnsmasq.d:rw"
      "/home/opdavies/pihole/etc-pihole:/etc/pihole:rw"
    ];

    ports = [
      "53:53/tcp"
      "53:53/udp"
      "67:67/udp"
      "${toString port}:80/tcp"
    ];

    log-driver = "journald";

    extraOptions = [
      "--cap-add=NET_ADMIN"
    ];
  };

  systemd.services."podman-pihole".serviceConfig = {
    Restart = lib.mkOverride 90 "always";
    RestartSec = lib.mkOverride 90 "1s";
  };
}
