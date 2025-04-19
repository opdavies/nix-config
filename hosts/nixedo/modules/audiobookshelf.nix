{ config, ... }:

{
  services = {
    audiobookshelf = {
      enable = true;

      port = 4001;
    };

    caddy.virtualHosts."audiobookshelf.oliverdavies.uk" = {
      useACMEHost = "oliverdavies.uk";

      extraConfig = "reverse_proxy localhost:${toString config.services.audiobookshelf.port}";
    };
  };
}
