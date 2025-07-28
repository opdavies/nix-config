{ config, ... }:

{
  flake.modules.nixos."hosts/t480".home-manager.users.${config.flake.meta.owner.username} = args: {
    programs.tmux-sessionizer.searchPaths =
      let
        inherit (args.config.xdg) userDirs;
      in
      [
        "${userDirs.extraConfig.XDG_REPOS_DIR}:2"
        "${userDirs.documents}:1"
        "${args.config.home.homeDirectory}/tmp"
      ];
  };
}
