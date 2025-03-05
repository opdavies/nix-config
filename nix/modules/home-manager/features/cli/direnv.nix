{ config, lib, ... }:

with lib;

{
  options.homeManagerModules.direnv.enable = mkEnableOption "Enable direnv";

  config = mkIf config.homeManagerModules.direnv.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;

      nix-direnv.enable = true;

      silent = true;
    };
  };
}
