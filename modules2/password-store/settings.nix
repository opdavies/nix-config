{
  flake.modules.homeManager.base =
    { config, ... }:
    {
      programs.password-store.settings.PASSWORD_STORE_DIR = "${config.xdg.dataHome}/pass";
    };
}
