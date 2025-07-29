{ config, ... }:

{
  flake.modules.nixos."nixosConfigurations/t480".home-manager.users.${config.flake.meta.owner.username} =
    hmArgs: {
      programs.dev-commit.schedule.enable = true;
      programs.dev-commit.schedule.time = "daily";

      programs.dev-commit.repoPaths =
        let
          repos = "${hmArgs.config.xdg.userDirs.extraConfig.XDG_REPOS_DIR}/forgejo/opdavies";
        in
        [
          "${repos}/email-filters"
          "${repos}/nix-config"
          "${repos}/oliverdavies.uk"
          "${repos}/opentofu-dns"
        ];
    };
}
