{
  features.homelab = {
    enable = true;

    baseDomain = "oliverdavies.uk";

    services = {
      audiobookshelf.enable = true;

      forgejo = {
        enable = true;

        cloudflared.tunnelId = "e1514105-327f-4984-974e-e2fbaca76466";
      };

      immich.enable = true;
      jellyfin.enable = true;
      paperless.enable = true;
      uptime-kuma.enable = true;
    };
  };
}
