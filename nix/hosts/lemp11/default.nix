{ ... }:

{
  features = {
    cli = {
      docker.enable = true;
    };

    desktop = {
      autorandr.enable = true;
      gaming.enable = true;
      peek.enable = true;
    };

    homelab = {
      forgejo.enable = true;
      gitea.enable = true;
      immich.enable = true;
      jellyfin.enable = true;
      paperless.enable = true;
      pihole.enable = true;
      tubearchivist-container.enable = true;
    };
  };

  imports = [
    ../common
    ../../users/opdavies

    ./configuration.nix
  ];
}
