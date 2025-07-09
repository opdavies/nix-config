{ inputs, self, ... }:

{
  perSystem =
    { pkgs, system, ... }:
    let
      # TODO: refactor to use inputs' or similar.
      nixvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit pkgs;

        module = import "${self}/modules/home-manager/coding/neovim/config";
      };
    in
    {
      packages = {
        inherit nixvim;

        default = pkgs.mkShell { buildInputs = with pkgs; [ just ]; };
      };
    };
}
