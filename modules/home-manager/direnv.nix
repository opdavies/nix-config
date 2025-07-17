{ config, lib, ... }:

with lib;

let
  cfg = config.features.cli.direnv;
in
{
  options.features.cli.direnv.enable = mkEnableOption "Enable direnv";

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;

      nix-direnv.enable = true;

      silent = true;
    };
  };
}
