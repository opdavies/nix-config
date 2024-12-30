{ username, ... }:

{
  imports = [
    ../common

    ./configuration.nix
  ];

  wsl = {
    enable = true;
    defaultUser = username;
  };
}
