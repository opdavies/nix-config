{
  homelab = {
    enable = true;

    cloudflared.tunnelId = "e1514105-327f-4984-974e-e2fbaca76466";

    domain = "oliverdavies.uk";

    services = {
      audiobookshelf.enable = true;
      forgejo.enable = true;
      gitea-actions-runner.enable = true;
      home-assistant.enable = true;
      homepage-dashboard.enable = true;
      immich.enable = true;
      jellyfin.enable = true;
      paperless.enable = true;
      peertube.enable = false;
      tubearchivist.enable = true;
      uptime-kuma.enable = true;
      vaultwarden.enable = true;
    };
  };
}
