{
  imports = [
    ../common
    ../../users/opdavies

    ./configuration.nix
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
