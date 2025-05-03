{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = homelab.services.${service};
  homelab = config.homelab;
  service = "gitea-actions-runner";
in
{
  options.homelab.services.${service} = {
    enable = mkEnableOption "Enable ${service}";
  };

  config = mkIf cfg.enable {
    services.${service}.instances.default = {
      enable = true;

      hostPackages = with pkgs; [
        bash
        coreutils
        curl
        gawk
        gitMinimal
        gnused
        nix
        nodejs
        wget
      ];

      labels = [
        "nixos:host"
      ];

      name = config.networking.hostName;
      tokenFile = config.age.secrets.forgejo-runner-token.path;
      url = config.services.forgejo.settings.server.ROOT_URL;
    };

    age.secrets = {
      forgejo-runner-token.file = "${inputs.self}/secrets/forgejo-runner-token.age";
    };
  };
}
