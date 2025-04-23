{ pkgs, ... }:

with pkgs;

vimUtils.buildVimPlugin {
  name = "standard-vim";
  version = "unstable-2018-10-15";

  src = fetchFromGitHub {
    owner = "tjdevries";
    repo = "standard.vim";
    rev = "b333ef9a9cf6cf66536deda017a542843613fa75";
    sha256 = "9VwkvV1Dv6cE4uDkPp36DozjWJOclDR883yDMYw000E=";
  };
}
