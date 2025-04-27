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
