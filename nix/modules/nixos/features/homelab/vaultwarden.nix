{ config, lib, ... }:

with lib;

{
  options.features.homelab.vaultwarden.enable = mkEnableOption "Enable vaultwarden";

  config = mkIf config.features.homelab.vaultwarden.enable {
    services = {
      vaultwarden = {
        enable = true;

        config = {
          DOMAIN = "https://vaultwarden.opdavies.uk";

          # TODO: check registrations are disabled.
          SIGNUPS_ALLOWED = false;

          ROCKET_ADDRESS = "127.0.0.1";
          ROCKET_PORT = 8222;
        };
      };

      caddy.virtualHosts."vaultwarden.opdavies.uk" = {
        useACMEHost = "opdavies.uk";

        extraConfig = "reverse_proxy localhost:${toString config.services.vaultwarden.config.ROCKET_PORT}";
      };
    };
  };
}
