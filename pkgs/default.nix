{ pkgs, prev, ... }:

let
  inherit (pkgs) callPackage;

  vimPlugins = callPackage ./vim-plugins { };
in
{
  backup-websites = callPackage ./backup-websites.nix { };
  build-glove80 = callPackage ./build-glove80.nix { };
  dev-commit = callPackage ./dev-commit.nix { };
  displayselect = callPackage ./displayselect { };
  notes = callPackage ./notes { };
  passmenu-otp = callPackage ./passmenu-otp.nix { };
  tmux-sessionizer = callPackage ./tmux-sessionizer { };
  upload-to-files = callPackage ./upload-to-files.nix { };

  vimPlugins = prev.vimPlugins // vimPlugins;
}
