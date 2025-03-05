{ config, lib, ... }:

with lib;

let
  port = 2222;
in
{
  options.nixosModules.gitea.enable = mkEnableOption "Enable gitea";

  config = mkIf config.nixosModules.gitea.enable {
    services = {
      gitea = {
        enable = true;
        group = "media";
        stateDir = "/mnt/media/gitea";

        settings = {
          server = {
            HTTP_PORT = port;
          };

          service = {
            DISABLE_REGISTRATION = true;
          };
        };
      };

      caddy.virtualHosts."gitea.oliverdavies.uk" = {
        useACMEHost = "oliverdavies.uk";

        extraConfig = "reverse_proxy localhost:${toString port}";
      };
    };
  };
}
