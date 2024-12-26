{ pkgs, lib, ... }:

let
  port = 4003;
in
{
  imports = [ ./container.nix ];

  services.nginx = {
    enable = true;

    virtualHosts."freshrss.oliverdavies.uk".locations."/".proxyPass =
      "http://localhost:${toString port}/";
  };
}
