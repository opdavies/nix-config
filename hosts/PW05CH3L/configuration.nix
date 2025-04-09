{ inputs, username, ... }:

let
  git = {
    name = "Oliver Davies";
    emailAddress = "oliver.davies@tfw.wales";
  };
in
{
  imports = [
    ../../modules/editor/nvim.nix
    ../../modules/mixins/common
    ../../modules/mixins/direnv.nix
    ../../modules/mixins/docker.nix
    ../../modules/mixins/fzf.nix
    ../../modules/mixins/node.nix
    ../../modules/mixins/phpactor
    ../../modules/mixins/ranger.nix
    ../../modules/mixins/scripts
    ../../modules/mixins/starship.nix
    ../../modules/mixins/tmux.nix
    ../../modules/mixins/zsh

    (import ../../modules/mixins/git.nix { inherit git; })

    ./modules/notes.nix
    ./modules/wiki.nix

    ../../users/opdavies
  ];

  wsl = {
    enable = true;
    defaultUser = username;
  };

  home-manager.users.opdavies.home.sessionVariables.WAYLAND_DISPLAY = "";
}
