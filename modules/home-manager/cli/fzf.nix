{ config, lib, ... }:

with lib;

let
  cfg = config.homeManagerModules.cli.fzf;
in
{
  options.homeManagerModules.cli.fzf.enable = mkEnableOption "Enable fzf";

  config = mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    home.sessionVariables = {
      FZF_DEFAULT_OPTS = "--reverse";
    };
  };
}
