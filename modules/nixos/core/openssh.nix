{ config, lib, ... }:

with lib;

let
  cfg = config.core.openssh;
in
{
  options.core.openssh.enable = mkEnableOption "Enable openssh";

  config = mkIf cfg.enable {
    services.openssh = {
      enable = true;

      openFirewall = lib.mkForce true;

      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = lib.mkForce "no";
      };
    };
  };
}
