{ config }:

[
  {
    "Media" = [
      {
        "Jellyfin" = {
          href = "https://jellyfin.oliverdavies.uk";
          icon = "jellyfin";
          description = "The Free Software Media System";
          siteMonitor = "http://localhost:8096";
        };
      }

      {
        "Immich" = {
          href = "https://photos.oliverdavies.uk";
          icon = "immich";
          description = "Self-hosted photo and video management solution";
          siteMonitor = "http://localhost:${toString config.services.immich.port}";
        };
      }

      {
        "Audiobookshelf" = {
          href = "https://audiobookshelf.oliverdavies.uk";
          icon = "audiobookshelf";
          description = "Self-hosted audiobook and podcast server";
          siteMonitor = "http://localhost:4001";
        };
      }
    ];
  }

  {
    "Services" = [
      {
        "Paperless-ngx" =
          let
            cfg = config.services.paperless;
          in
          {
            description = "Document management system";
            href = cfg.settings.PAPERLESS_URL;
            icon = "paperless";
            siteMonitor = "http://localhost:${toString cfg.port}";
          };
      }
    ];
  }
]
