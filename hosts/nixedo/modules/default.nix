{ lib, ... }:

with lib;

{
  options.homelab = {
    enable = mkEnableOption "Enable homelab services and configuration";

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
    ./immich.nix
    ./jellyfin.nix
    ./nginx
    ./paperless.nix
  ];
}
