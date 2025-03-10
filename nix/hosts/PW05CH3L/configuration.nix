{
  inputs,
  pkgs,
  username,
  ...
}:

{
  imports = [
    ../common
    ../../users/opdavies
  ];

  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];

  nixosModules = {
    docker.enable = true;
  };

  wsl = {
    enable = true;
    defaultUser = username;
  };

  services.syncthing.enable = true;

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
