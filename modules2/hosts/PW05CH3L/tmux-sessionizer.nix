{ config, ... }:

{
  flake.modules.nixos."nixosConfigurations/PW05CH3L".home-manager.users.${config.flake.meta.owner.username} =
    args: {
      programs.tmux-sessionizer.searchPaths =
        let
          inherit (args.config.xdg) userDirs;
        in
        [
          "${userDirs.extraConfig.XDG_REPOS_DIR}:3"
          "${userDirs.documents}:1"
        ];
    };
}
