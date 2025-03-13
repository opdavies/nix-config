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

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
