{
  inputs,
  pkgs,
  prev,
  ...
}:

let
  inherit (pkgs) callPackage;

  vimPlugins = callPackage ./vim-plugins { };
in
{
  _timer = callPackage ./_timer.nix { };
  backup-websites = callPackage ./backup-websites.nix { };
  build-glove80 = callPackage ./build-glove80.nix { };
  count-tags = callPackage ./count-tags.nix { };
  create-script = callPackage ./create-script.nix { };
  dev-commit = callPackage ./dev-commit.nix { };
  displayselect = callPackage ./displayselect { };
  get-tags = callPackage ./get-tags.nix { };
  git-exclude = callPackage ./git-exclude.nix { };
  git-graph = callPackage ./git-graph.nix { };
  import-to-jellyfin = callPackage ./import-to-jellyfin.nix { };
  mounter = callPackage ./mounter.nix { };
  move-firefox-screenshots = callPackage ./move-firefox-screenshots.nix { };
  notes = callPackage ./notes { };
  passmenu-otp = callPackage ./passmenu-otp.nix { };
  set-background = callPackage ./set-background.nix { };
  tag-release = callPackage ./tag-release.nix { };
  time-until = callPackage ./time-until.nix { };
  timer = callPackage ./timer.nix { };
  tmux-sessionizer = callPackage ./tmux-sessionizer { };
  todos-add = callPackage ./todos-add.nix { };
  todos-edit = callPackage ./todos-edit.nix { };
  unmounter = callPackage ./unmounter.nix { };
  update-all-git-repos = callPackage ./update-all-git-repos.nix { };
  vic = callPackage ./vic.nix { inherit inputs; };
  zet-new = callPackage ./zet-new.nix { };

  vimPlugins = prev.vimPlugins // vimPlugins;
}
