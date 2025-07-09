{ config, lib, ... }:

with lib;

let
  cfg = config.features.core.openssh;
in
{
  options.features.core.openssh.enable = mkEnableOption "Enable openssh";

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
