{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    ./homepage
    ./samba.nix
    ./uptime-kuma.nix
    ./vaultwarden.nix
  ];

  services = {
    postgresqlBackup.enable = true;
    tailscale.enable = true;
  };

  services.gitea-actions-runner.instances.default = {
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
}
