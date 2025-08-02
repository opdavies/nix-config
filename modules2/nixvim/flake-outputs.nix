{ config, ... }:

{
  perSystem =
    { inputs', pkgs, ... }:
    {
      packages.neovim = inputs'.nixvim.legacyPackages.makeNixvimWithModule {
        inherit pkgs;

        module = config.flake.modules.nixvim.custom;
      };
    };
}
