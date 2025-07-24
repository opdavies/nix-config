{ config, ... }:

{
  flake.modules.homeManager.base.programs.git = {
    userName = config.flake.meta.owner.name;
    userEmail = config.flake.meta.owner.email;
  };
}
