{ config, pkgs, ... }:

{
  services = {
    immich = {
      enable = true;
      group = "media";
      mediaLocation = "/mnt/media/immich";
    };

    caddy.virtualHosts."immich.oliverdavies.uk" = {
      useACMEHost = "oliverdavies.uk";

      extraConfig = "reverse_proxy localhost:${toString config.services.immich.port}";
    };
  };

  environment.systemPackages = [ pkgs.immich-cli ];
}
