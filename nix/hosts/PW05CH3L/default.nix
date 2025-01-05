{ username, ... }:

{
  imports = [
    ../common
    ../../users/opdavies

    ./configuration.nix
  ];

  features = {
    cli = {
      docker.enable = true;
    };
  };

  wsl = {
    enable = true;
    defaultUser = username;
  };
}
