{ self, ... }:

{
  perSystem =
    { inputs', pkgs, ... }:
    {
      packages = {
        default = pkgs.mkShell { buildInputs = with pkgs; [ just ]; };

        neovim = inputs'.nixvim.legacyPackages.makeNixvimWithModule {
          inherit pkgs;

          module = import "${self}/modules/home-manager/coding/neovim/config";
        };
      };
    };
}
