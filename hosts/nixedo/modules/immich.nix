{ config, pkgs, ... }:

{
  services.immich = {
    enable = true;
    group = "media";
    mediaLocation = "/mnt/media/immich";
  };

  services.nginx.virtualHosts."photos.oliverdavies.uk" = {
    forceSSL = true;
    useACMEHost = "oliverdavies.uk";

    locations."/" = {
      proxyPass = "http://localhost:${toString config.services.immich.port}";
      proxyWebsockets = true;
      recommendedProxySettings = true;
    };
  };

  environment.systemPackages = with pkgs; [
    immich-cli
    immich-go
  ];
}
