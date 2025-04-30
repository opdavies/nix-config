{ lib, ... }:

with lib;

{
  options.features.homelab = {
    enable = mkEnableOption "Enable homelab services and configuration";

    baseDomain = mkOption {
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
    ./immich.nix
    ./jellyfin.nix
    ./nginx
    ./paperless.nix
  ];
}
