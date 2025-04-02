{ inputs, username, ... }:

{
  imports = [
    ../common
    ../../users/opdavies
  ];

  nixosModules = {
    docker.enable = true;
  };

  wsl = {
    enable = true;
    defaultUser = username;
  };

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
