{ pkgs, lib, ... }:

let
  port = 4003;
in
{
  imports = [ ./container.nix ];

  services.nginx = {
    enable = true;

    virtualHosts."freshrss.davies.home".locations."/".proxyPass = "http://localhost:${toString port}/";
  };

  # TODO: move to pihole.
  networking.hosts = {
    "127.0.0.1" = [ "freshrss.davies.home" ];
  };
}
