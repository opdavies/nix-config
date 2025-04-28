{ config, ... }:

{
  services =
    let
      cfg = config.services.homepage-dashboard;
    in
    {
      homepage-dashboard = {
        enable = true;
        listenPort = 8097;
        openFirewall = true;

        services = (import ./services.nix { inherit config; });
        widgets = import ./widgets.nix;
      };

      nginx.virtualHosts."nixedo.oliverdavies.uk" = {
        forceSSL = true;
        useACMEHost = "oliverdavies.uk";

        locations."/" = {
          proxyPass = "http://localhost:${toString cfg.listenPort}";
          recommendedProxySettings = true;
        };
      };
    };
}
