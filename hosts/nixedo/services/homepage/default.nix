{
  services = {
    homepage-dashboard = {
      enable = true;
      listenPort = 8097;
      openFirewall = true;

      services = import ./services.nix;
      widgets = import ./widgets.nix;
    };

    nginx.virtualHosts."nixedo.oliverdavies.uk" = {
      forceSSL = true;
      useACMEHost = "oliverdavies.uk";

      locations."/".proxyPass =
        "http://localhost:${toString config.services.homepage-dashboard.listenPort}";
    };
  };
}
