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
