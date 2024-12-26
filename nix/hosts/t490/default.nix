{
  imports = [
    ../common

    ./configuration.nix
  ];

  features = {
    desktop = {
      gaming.enable = true;
      i3.enable = true;
      peek.enable = true;
    };
  };
}
