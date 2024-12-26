{ config, lib, ... }:

with lib;

let
  cfg = config.features.homelab.audiobookshelf;
in
{
  options.features.homelab.audiobookshelf.enable = mkEnableOption "Enable audiobookshelf";

  config = mkIf cfg.enable {
    services.audiobookshelf = {
      enable = true;

      host = "audiobookshelf.davies.home";
      port = 4001;
    };

    services.nginx = {
      enable = true;

      virtualHosts."audiobookshelf.davies.home" = {
        locations."/" = {
          proxyPass = "http://localhost:${toString config.services.audiobookshelf.port}/";
          proxyWebsockets = true;
        };
      };
    };
  };
}
