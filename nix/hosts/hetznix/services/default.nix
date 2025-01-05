{
  imports = [
    ./acme.nix
    ./caddy
  ];

  services = {
    openssh.enable = true;
  };
}
