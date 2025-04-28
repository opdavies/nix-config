{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.nixosModules.homelab.immich;
in
{
  options.nixosModules.homelab.immich = {
    enable = mkEnableOption "Enable immich";
  };

  config = mkIf cfg.enable {
    services = {
      immich = {
        enable = true;
        group = "media";
        mediaLocation = "/mnt/media/immich";
      };

      nginx.virtualHosts."photos.oliverdavies.uk" = {
        forceSSL = true;
        useACMEHost = "oliverdavies.uk";

        locations."/" = {
          proxyPass = "http://localhost:${toString config.services.immich.port}";
          recommendedProxySettings = true;
        };
      };
    };

    environment.systemPackages = with pkgs; [
      immich-cli
      immich-go
    ];
  };
}
