{ lib, ... }:

{
  flake.modules.nixos.pc.services.openssh.settings = {
    PasswordAuthentication = false;
    PermitRootLogin = lib.mkForce "no";
  };
}
