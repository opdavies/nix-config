{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.nixosModules.cli.password-store;
in
{
  options.nixosModules.cli.password-store.enable = mkEnableOption "Enable pass";

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      passmenu-otp

      (pass.withExtensions (
        e: with e; [
          passExtensions.pass-audit
          passExtensions.pass-import
          passExtensions.pass-otp
          passExtensions.pass-update
        ]
      ))
    ];
  };
}
