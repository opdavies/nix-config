{ config, ... }:

{
  services = {
    forgejo = {
      enable = true;
      stateDir = "/var/www/forgejo";

      settings = {
        server = {
          DOMAIN = "code.oliverdavies.uk";
          HTTP_PORT = 2223;
        };

        service = {
          DISABLE_REGISTRATION = true;
        };
      };
    };

    cloudflared.tunnels."e1514105-327f-4984-974e-e2fbaca76466".ingress = {
      "code.oliverdavies.uk" =
        "http://localhost:${toString config.services.forgejo.settings.server.HTTP_PORT}";
    };
  };
}
