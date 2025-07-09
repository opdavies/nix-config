{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          just
          lua-language-server
          lua54Packages.luacheck
          nixd
        ];
      };
    };
}
