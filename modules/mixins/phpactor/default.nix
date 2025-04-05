{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    phpactor
  ];

  home-manager.users.opdavies.xdg.configFile.phpactor = {
    source = ./config;
    recursive = true;
  };
}
