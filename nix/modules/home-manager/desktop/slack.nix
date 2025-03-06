{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.homeManagerModules.slack.enable = mkEnableOption "Enable Slack";

  config = mkIf config.homeManagerModules.slack.enable {
    home.packages = with pkgs; [ slack ];
  };
}
