{ username, ... }:

{
  imports = [
    ../common

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
