{ lib, ... }:

{
  flake.modules.nixos.pc.services.openssh.openFirewall = lib.mkForce true;
}
