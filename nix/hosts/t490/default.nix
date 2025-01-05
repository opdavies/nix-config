{
  imports = [
    ../common
    ../../users/opdavies

    ./configuration.nix
    ./hardware.nix
    ./programs.nix
    ./services
    ./users.nix
  ];

  features = {
    desktop = {
      autorandr.enable = true;
      gaming.enable = true;
      i3.enable = true;
      peek.enable = true;
    };
  };
}
