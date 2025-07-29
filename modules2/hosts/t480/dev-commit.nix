{ config, ... }:

{
  flake.modules.nixos."nixosConfigurations/t480".home-manager.users.${config.flake.meta.owner.username} =
    hmArgs: {
      programs.dev-commit.enable = true;

      programs.dev-commit.schedule.enable = true;
      programs.dev-commit.schedule.time = "daily";

      programs.dev-commit.repoPaths =
        let
          repos = "${hmArgs.config.xdg.userDirs.extraConfig.XDG_REPOS_DIR}/forgejo/opdavies";
        in
        map (name: "${repos}/${name}") [
          "email-filters"
          "nix-config"
          "oliverdavies.uk"
          "opentofu-dns"
        ];
    };
}
