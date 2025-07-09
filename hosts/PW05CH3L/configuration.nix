{ inputs, pkgs, ... }:

{
  imports = [
    inputs.agenix.nixosModules.default
    inputs.disko.nixosModules.disko
    inputs.nixos-wsl.nixosModules.default

    ../common

    ../../users/opdavies.nix
  ];

  features = {
    cli = {
      docker.enable = true;

      password-store = {
        enable = true;

        extensions = with pkgs.passExtensions; [
          pass-otp
        ];
      };
    };
  };

  wsl = {
    enable = true;
    defaultUser = "opdavies";
  };

  home-manager.users.opdavies.home.sessionVariables.WAYLAND_DISPLAY = "";
}
