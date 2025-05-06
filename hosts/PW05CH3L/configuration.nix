{ pkgs, ... }:

{
  imports = [
    ../common

    ../../users/opdavies.nix
  ];

  cli = {
    docker.enable = true;

    password-store = {
      enable = true;

      extensions = with pkgs.passExtensions; [
        pass-otp
      ];
    };
  };

  wsl = {
    enable = true;
    defaultUser = "opdavies";
  };

  home-manager.users.opdavies.home.sessionVariables.WAYLAND_DISPLAY = "";
}
