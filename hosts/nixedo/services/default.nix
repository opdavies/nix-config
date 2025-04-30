{
  imports = [
    ./homepage
    ./samba.nix
    ./uptime-kuma.nix
    ./vaultwarden.nix
  ];

  services = {
    tailscale.enable = true;
  };
}
