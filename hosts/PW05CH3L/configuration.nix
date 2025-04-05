{ inputs, username, ... }:

{
  imports = [
    ../../modules/editor/nvim.nix
    ../../modules/mixins/common.nix
    ../../modules/mixins/direnv.nix
    ../../modules/mixins/docker.nix
    ../../modules/mixins/fzf.nix
    ../../modules/mixins/git.nix
    ../../modules/mixins/node.nix
    ../../modules/mixins/phpactor
    ../../modules/mixins/ranger.nix
    ../../modules/mixins/starship.nix
    ../../modules/mixins/tmux.nix
    ../../modules/mixins/zsh

    ./modules/notes.nix
    ./modules/wiki.nix

    ../../users/opdavies
  ];

  wsl = {
    enable = true;
    defaultUser = username;
  };

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  home-manager.users.opdavies.home.sessionVariables.WAYLAND_DISPLAY = "";
}
