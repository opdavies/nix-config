{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      programs.tmux.plugins = with pkgs.tmuxPlugins; [
        resurrect
        yank
      ];
    };
}
