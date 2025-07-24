{ config, ... }:

{
  flake.modules.homeManager.base = args: {
    home = {
      homeDirectory = "/home/${config.flake.meta.owner.username}";
      username = config.flake.meta.owner.username;
    };

    programs.home-manager.enable = true;

    systemd.user.startServices = "sd-switch";
  };
}
