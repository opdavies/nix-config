{ config, ... }:

{
  users.users.opdavies = { };

  home-manager.users.opdavies = import ../../../home/opdavies/${config.networking.hostName}.nix;
}
