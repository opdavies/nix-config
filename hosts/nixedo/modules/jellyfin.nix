{
  services = {
    jellyfin = {
      enable = true;
      openFirewall = true;
      group = "media";
      configDir = "/mnt/media/jellyfin";
    };

    caddy.virtualHosts."jellyfin.oliverdavies.uk" = {
      useACMEHost = "oliverdavies.uk";

      extraConfig = "reverse_proxy localhost:8096";
    };
  };
}
