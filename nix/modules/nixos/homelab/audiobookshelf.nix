{ config, lib, ... }:

with lib;

let
  cfg = config.nixosModules.audiobookshelf;
in
{
  options.nixosModules.audiobookshelf.enable = mkEnableOption "Enable audiobookshelf";

  config = mkIf cfg.enable {
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
  };
}
