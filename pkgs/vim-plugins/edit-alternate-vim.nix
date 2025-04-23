{ pkgs, ... }:

with pkgs;

vimUtils.buildVimPlugin {
  name = "edit-alternate-vim";
  version = "unstable-2021-10-25";

  src = fetchFromGitHub {
    owner = "tjdevries";
    repo = "edit_alternate.vim";
    rev = "ef3019115d9bb7ffd691d2859eda213dd99e0b0a";
    sha256 = "mEKnqYAhgrdxPRoKf4S4yYecdFIHGg8bDxpqPuC1+S4=";
  };
}
