{ inputs, ... }:

{
  imports = [
    inputs.agenix.nixosModules.default
    inputs.disko.nixosModules.disko
    inputs.nixos-wsl.nixosModules.default

    ../common

    ../../users/opdavies.nix
  ];

  wsl = {
    enable = true;
    defaultUser = "opdavies";
  };

  home-manager.users.opdavies.home.sessionVariables.WAYLAND_DISPLAY = "";
}
