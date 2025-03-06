{ config, lib, ... }:

with lib;

{
  options.nixosModules.vaultwarden.enable = mkEnableOption "Enable vaultwarden";

  config = mkIf config.nixosModules.vaultwarden.enable {
    services = {
      vaultwarden = {
        enable = true;

        config = {
          DOMAIN = "https://vaultwarden.oliverdavies.uk";

          # TODO: check registrations are disabled.
          SIGNUPS_ALLOWED = false;

          ROCKET_ADDRESS = "127.0.0.1";
          ROCKET_PORT = 8222;
        };
      };

      caddy.virtualHosts."vaultwarden.oliverdavies.uk" = {
        useACMEHost = "oliverdavies.uk";

        extraConfig = "reverse_proxy localhost:${toString config.services.vaultwarden.config.ROCKET_PORT}";
      };
    };
  };
}
