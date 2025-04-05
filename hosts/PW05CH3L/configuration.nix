{ inputs, username, ... }:

{
  imports = [
    ../../modules/mixins/direnv.nix
    ../../modules/mixins/docker.nix
    ../../modules/mixins/phpactor

    ../common
    ../../users/opdavies
  ];

  wsl = {
    enable = true;
    defaultUser = username;
  };

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
