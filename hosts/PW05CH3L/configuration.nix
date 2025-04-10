{ inputs, username, ... }:

let
  git = {
    name = "Oliver Davies";
    emailAddress = "oliver.davies@tfw.wales";
  };
in
{
  imports = with inputs.self.nixosModules; [
    editor-nvim
    mixins-common
    mixins-direnv
    mixins-docker
    mixins-fzf
    mixins-node
    mixins-phpactor
    mixins-ranger
    mixins-scripts
    mixins-starship
    mixins-tmux
    mixins-zsh

    users-opdavies

    (import ../../modules/mixins/git.nix { inherit git; })

    ./modules/notes.nix
    ./modules/wiki.nix
  ];

  wsl = {
    enable = true;
    defaultUser = username;
  };

  home-manager.users.opdavies.home.sessionVariables.WAYLAND_DISPLAY = "";
}
