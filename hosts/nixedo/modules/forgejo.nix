{ config, ... }:

{
  services.forgejo = {
    enable = true;
    stateDir = "/var/www/forgejo";

    settings = {
      server = {
        DOMAIN = "code.oliverdavies.uk";
        LANDING_PAGE = "explore";
        ROOT_URL = "https://${config.services.forgejo.settings.server.DOMAIN}";
      };

      service.DISABLE_REGISTRATION = true;

      ui.DEFAULT_THEME = "forgejo-auto";
    };
  };

  services.cloudflared.tunnels.${config.homelab.cloudflared.tunnelId}.ingress = {
    "${config.services.forgejo.settings.server.DOMAIN}" =
      "http://localhost:${toString config.services.forgejo.settings.server.HTTP_PORT}";
  };
}
