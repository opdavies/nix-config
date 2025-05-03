{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.cli.password-store;
in
{
  options.cli.password-store = {
    enable = mkEnableOption "Enable pass";

    extensions = mkOption {
      default = [ ];
      type = types.listOf types.package;
      description = "pass extensions to install.";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      (pass.withExtensions (e: with e; cfg.extensions))
    ];
  };
}
