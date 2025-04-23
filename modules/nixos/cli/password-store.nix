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
  options.nixosModules.cli.password-store = {
    enable = mkEnableOption "Enable pass";

    extensions = mkOption {
      default = [ ];
      type = types.listOf types.package;
      description = "pass extensions to install.";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      passmenu-otp

      (pass.withExtensions (e: with e; cfg.extensions))
    ];
  };
}
