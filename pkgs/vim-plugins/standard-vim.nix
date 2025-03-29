{ pkgs, ... }:

with pkgs;

vimUtils.buildVimPlugin {
  name = "standard-vim";
  src = fetchFromGitHub {
    owner = "tjdevries";
    repo = "standard.vim";
    rev = "master";
    sha256 = "9VwkvV1Dv6cE4uDkPp36DozjWJOclDR883yDMYw000E=";
  };
}
