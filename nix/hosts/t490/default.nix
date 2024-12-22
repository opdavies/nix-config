{
  imports = [
    ../common

    ./configuration.nix
  ];

  features = {
    desktop = {
      gaming.enable = true;
      peek.enable = true;
    };
  };
}
