{ lib, ... }:

{
  services.openssh = {
    enable = true;

    openFirewall = lib.mkForce true;

    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = lib.mkForce "no";
    };
  };
}
