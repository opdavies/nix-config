{
  flake.modules.homeManager.base =
    { config, ... }:
    let
      inherit (config.xdg) configHome dataHome stateHome;
    in
    {
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
