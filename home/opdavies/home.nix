{ config, ... }:

{
  home.username = "opdavies";
  home.homeDirectory = "/home/${config.home.username}";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs.
  systemd.user.startServices = "sd-switch";
}
