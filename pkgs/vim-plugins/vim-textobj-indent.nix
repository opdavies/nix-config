{ pkgs, ... }:

with pkgs;

vimUtils.buildVimPlugin {
  name = "vim-textobj-indent";
  version = "0.0.6";

  src = fetchFromGitHub {
    owner = "kana";
    repo = "vim-textobj-indent";
    rev = "v${version}";
    sha256 = "oFzUPG+IOkbKZ2gU/kduQ3G/LsLDlEjFhRP0BHBE+1Q=";
  };
}
