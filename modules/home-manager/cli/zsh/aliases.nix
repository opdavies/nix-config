{ config, ... }:

{
  "$" = "";
  "-" = "cd -";
  ".." = "cd ..";
  "..." = "cd ../..";
  "...." = "cd ../../..";
  "....." = "cd ../../../..";
  s = "secrets";
  secrets = ''doppler --project "$(whoami)" run'';
  tag = "tag-release";
  vss = "LC_ALL=C sort --unique ${config.xdg.userDirs.extraConfig.XDG_REPOS_DIR}/nixos-config/modules/home-manager/cli/neovim/config/spell/en.utf-8.adddotfiles/nvim/spell/en.utf-8.add --output ${config.xdg.userDirs.extraConfig.XDG_REPOS_DIR}/nixos-config/modules/home-manager/cli/neovim/config/spell/en.utf-8.add";
  wt = "git worktree";
}
