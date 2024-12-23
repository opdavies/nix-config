{ inputs, ... }:

{
  features = {
    cli = {
      docker.enable = true;
    };

    desktop = {
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

    ./configuration.nix
    ./secrets.nix

    ./modules/nginx.nix
  ];
}
