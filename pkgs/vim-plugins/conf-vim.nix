{ pkgs, ... }:

with pkgs;

vimUtils.buildVimPlugin {
  name = "conf-vim";
  src = fetchFromGitHub {
    owner = "tjdevries";
    repo = "conf.vim";
    rev = "master";
    sha256 = "AjiTJsoim0BAnyfqk1IQzNsa6jhFM2+A66E7q9sJqz0=";
  };
}
