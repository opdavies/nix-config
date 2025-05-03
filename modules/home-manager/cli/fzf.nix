{ config, lib, ... }:

with lib;

let
  cfg = config.cli.fzf;
in
{
  options.cli.fzf.enable = mkEnableOption "Enable fzf";

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
