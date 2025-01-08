{ config, ... }:

{
  services = {
    forgejo = {
      enable = true;

      settings = {
        server = {
          DOMAIN = "code.oliverdavies.uk";
          HTTP_PORT = 2223;
          ROOT_URL = "https://${config.services.forgejo.settings.server.DOMAIN}";
          SSH_DOMAIN = "ssh.oliverdavies.uk";
        };

        service = {
          DISABLE_REGISTRATION = true;
        };
      };
    };

    caddy.virtualHosts."${config.services.forgejo.settings.server.DOMAIN}" = {
      useACMEHost = "oliverdavies.uk";

      extraConfig = "reverse_proxy localhost:${toString config.services.forgejo.settings.server.HTTP_PORT}";
    };

    openssh.settings.AllowUsers = [ "forgejo" ];
  };
}
