{ config, ... }:

{
  perSystem =
    { inputs', pkgs, ... }:
    {
      packages = {
        default = pkgs.mkShell { buildInputs = with pkgs; [ just ]; };

        neovim = inputs'.nixvim.legacyPackages.makeNixvimWithModule {
          inherit pkgs;

          module = config.flake.modules.nixvim.custom;
        };
      };
    };
}
