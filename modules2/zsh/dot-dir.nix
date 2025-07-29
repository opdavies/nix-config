{
  flake.modules.homeManager.base =
    { config, ... }:
    {
      programs.zsh.dotDir = "${config.xdg.configHome}/zsh";
    };
}
