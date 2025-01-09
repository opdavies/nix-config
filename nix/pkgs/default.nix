{ pkgs, prev, ... }:

let
  inherit (pkgs) callPackage;

  vimPlugins = callPackage ./vim-plugins { inherit callPackage; };
in
{
  build-glove80 = callPackage ./build-glove80.nix { };
  notes = callPackage ./notes.nix { };
  i3-battery-popup = callPackage ./i3-battery-popup.nix { };
  tmux-sessionizer = callPackage ./tmux-sessionizer.nix { };

  vimPlugins = prev.vimPlugins // vimPlugins;
}
