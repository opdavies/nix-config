{
  services.jellyfin = {
    enable = true;

    configDir = "/mnt/media/jellyfin";
    group = "media";
    openFirewall = true;
  };

  services.nginx.virtualHosts."jellyfin.oliverdavies.uk" = {
    forceSSL = true;
    useACMEHost = "oliverdavies.uk";

    locations."/" = {
      proxyPass = "http://localhost:8096";
      recommendedProxySettings = true;

      extraConfig = ''
        proxy_buffering off;
      '';
    };
  };
}
