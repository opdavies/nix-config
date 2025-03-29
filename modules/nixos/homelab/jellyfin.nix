{ config, lib, ... }:

with lib;

{
  options.nixosModules.jellyfin.enable = mkEnableOption "Enable jellyfin";

  config = mkIf config.nixosModules.jellyfin.enable {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
      group = "media";
      configDir = "/mnt/media/jellyfin";
    };

    services.caddy.virtualHosts."jellyfin.oliverdavies.uk" = {
      useACMEHost = "oliverdavies.uk";

      extraConfig = "reverse_proxy localhost:8096";
    };
  };
}
