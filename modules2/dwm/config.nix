{
  flake.modules.homeManager.gui =
    { config, ... }:
    {
      home = {
        file."${config.home.sessionVariables.XINITRC}".source = ./xinitrc;

        sessionVariables.XINITRC = "${config.xdg.configHome}/X11/xinitrc";
      };
    };
}
