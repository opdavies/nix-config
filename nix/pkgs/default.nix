{ pkgs, prev, ... }:

let
  inherit (pkgs) callPackage;

  vimPlugins = callPackage ./vim-plugins { inherit callPackage; };
in
{
  build-glove80 = callPackage ./build-glove80.nix { };
  notes = callPackage ./notes { };
  tmux-sessionizer = callPackage ./tmux-sessionizer { };
  upload-to-files = callPackage ./upload-to-files.nix { };

  vimPlugins = prev.vimPlugins // vimPlugins;
}
