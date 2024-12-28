{
  features = {
    cli = {
      docker.enable = true;
    };

    homelab = {
      forgejo.enable = true;
      gitea.enable = true;
      immich.enable = true;
      jellyfin.enable = true;
      paperless.enable = true;
      pihole.enable = true;
      tubearchivist-container.enable = true;
      # vaultwarden.enable = true;
    };
  };

  imports = [
    ../common

    ./configuration.nix
    ./secrets.nix
    ./extra.nix

    ./modules/nginx.nix
  ];
}
