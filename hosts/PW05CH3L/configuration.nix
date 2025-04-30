{
  imports = [
    ../common

    ../../users/opdavies.nix

    ./modules/wiki.nix
  ];

  features = {
    cli = {
      docker.enable = true;
      password-store.enable = true;
    };
  };

  wsl = {
    enable = true;
    defaultUser = "opdavies";
  };

  home-manager.users.opdavies.home.sessionVariables.WAYLAND_DISPLAY = "";
}
