{ config, lib, ... }:

with lib;

let
  cfg = config.homeManagerModules.cli.node;

  inherit (config.xdg) configHome dataHome stateHome;
in
{
  options.homeManagerModules.cli.node.enable = mkEnableOption "Enable node";

  config = mkIf cfg.enable {
    xdg.configFile."${config.home.sessionVariables.NPM_CONFIG_USERCONFIG}".text = ''
      cache=${configHome}/npm
      init-module=${configHome}/npm/config/npm-init.js
      logs-dir=${stateHome}/npm/logs
      prefix=${dataHome}/npm
    '';

    home.sessionVariables = {
      NPM_CONFIG_USERCONFIG = "${configHome}/npm/npmrc";
    };
  };
}
