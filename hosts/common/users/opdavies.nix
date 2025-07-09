{ config, self, ... }:

{
  users.users.opdavies = { };

  home-manager.users.opdavies = import "${self}/home-manager/opdavies/${config.networking.hostName}.nix";
}
