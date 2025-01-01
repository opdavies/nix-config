{ config, lib, ... }:

with lib;

let
  cfg = config.features.homelab.audiobookshelf;
in
{
  options.features.homelab.audiobookshelf.enable = mkEnableOption "Enable audiobookshelf";

  config = mkIf cfg.enable {
    services = {
      audiobookshelf = {
        enable = true;

        port = 4001;
      };

      caddy.virtualHosts."audiobookshelf.opdavies.uk" = {
        useACMEHost = "opdavies.uk";

        extraConfig = "reverse_proxy localhost:${toString config.services.audiobookshelf.port}";
      };
    };
  };
}
