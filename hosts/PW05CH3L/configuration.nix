{ inputs, username, ... }:

{
  imports = [
    ../../modules/editor/nvim.nix
    ../../modules/mixins/direnv.nix
    ../../modules/mixins/docker.nix
    ../../modules/mixins/fzf.nix
    ../../modules/mixins/phpactor
    ../../modules/mixins/starship.nix
    ../../modules/mixins/tmux.nix

    ../common
    ../../users/opdavies
  ];

  wsl = {
    enable = true;
    defaultUser = username;
  };

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
