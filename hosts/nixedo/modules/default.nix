{ lib, ... }:

with lib;

{
  options.homelab = {
    enable = mkEnableOption "Enable homelab services and configuration";

    cloudflared.tunnelId = mkOption {
      example = "00000000-0000-0000-0000-000000000000";
      type = types.str;
    };

    domain = mkOption {
      description = "The base domain to use for this homelab.";
      type = types.str;
    };
  };

  imports = [
    ./acme.nix
    ./audiobookshelf.nix
    ./cloudflared.nix
    ./containers
    ./forgejo.nix
    ./home-assistant.nix
    ./immich.nix
    ./jellyfin.nix
    ./nginx
    ./paperless.nix
    ./peertube.nix
  ];
}
