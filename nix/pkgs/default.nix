{ pkgs, prev, ... }:

let
  inherit (pkgs) callPackage;

  vimPlugins = callPackage ./vim-plugins { inherit callPackage; };
in
{
  backup-websites = callPackage ./backup-websites.nix { };
  build-glove80 = callPackage ./build-glove80.nix { };
  displayselect = callPackage ./displayselect { };
  notes = callPackage ./notes { };
  passmenu-otp = callPackage ./passmenu-otp.nix { };
  tmux-sessionizer = callPackage ./tmux-sessionizer { };
  upload-to-files = callPackage ./upload-to-files.nix { };

  vimPlugins = prev.vimPlugins // vimPlugins;
}
