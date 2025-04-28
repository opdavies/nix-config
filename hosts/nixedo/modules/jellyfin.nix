{
  services =
    let
      port = 8096;
    in
    {
      jellyfin = {
        enable = true;
        openFirewall = true;
        group = "media";
        configDir = "/mnt/media/jellyfin";
      };

      nginx.virtualHosts."jellyfin.oliverdavies.uk" = {
        forceSSL = true;
        useACMEHost = "oliverdavies.uk";

        locations."/" = {
          proxyPass = "http://localhost:${toString port}";
          recommendedProxySettings = true;

          extraConfig = ''
            proxy_buffering off;
          '';
        };
      };
    };
}
