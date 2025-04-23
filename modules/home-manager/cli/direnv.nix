{ config, lib, ... }:

with lib;

let
  cfg = config.homeManagerModules.cli.direnv;
in
{
  options.homeManagerModules.cli.direnv.enable = mkEnableOption "Enable direnv";

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;

      nix-direnv.enable = true;

      silent = true;
    };
  };
}
