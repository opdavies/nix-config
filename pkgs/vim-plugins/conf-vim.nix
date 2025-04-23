{ pkgs, ... }:

with pkgs;

vimUtils.buildVimPlugin {
  name = "conf-vim";
  version = "unstable-2017-10-09";

  src = fetchFromGitHub {
    owner = "tjdevries";
    repo = "conf.vim";
    rev = "a716df0fd5d7ba558c07dac2e07f05d5eba11afb";
    sha256 = "AjiTJsoim0BAnyfqk1IQzNsa6jhFM2+A66E7q9sJqz0=";
  };
}
