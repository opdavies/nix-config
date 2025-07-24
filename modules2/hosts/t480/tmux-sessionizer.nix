{
  flake.modules.homeManager.base =
    { config, ... }:
    {
      programs.tmux-sessionizer.searchPaths =
        let
          inherit (config.xdg) userDirs;
        in
        [
          "${userDirs.extraConfig.XDG_REPOS_DIR}:2"
          "${userDirs.documents}:1"
          "${config.home.homeDirectory}/tmp"
        ];
    };
}
