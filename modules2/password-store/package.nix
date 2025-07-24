{ lib, ... }:

{
  flake.modules.homeManager.base =
    { config, pkgs, ... }:
    {
      options.programs.password-store.extensions = lib.mkOption {
        default = [ ];
        type = lib.types.listOf lib.types.package;
        description = "pass extensions to install.";
      };

      config.programs.password-store.package = pkgs.pass.withExtensions (
        e: with e; config.programs.password-store.extensions
      );
    };
}
