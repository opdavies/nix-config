{
  features = {
    cli = {
      docker.enable = true;
    };

    homelab = {
      audiobookshelf.enable = true;
      beaverhabits.enable = true;
      freshrss.enable = true;
      gitea.enable = true;
      immich.enable = true;
      jellyfin.enable = true;
      paperless.enable = true;
      pihole.enable = true;
      tubearchivist-container.enable = true;
      vaultwarden.enable = true;
    };
  };

  imports = [
    ../common
    ../../users/opdavies

    ./configuration.nix
    ./secrets.nix
    ./extra.nix
  ];
}
