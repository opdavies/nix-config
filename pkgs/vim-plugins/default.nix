{ pkgs, lib }:

let
  pluginsData = builtins.fromJSON (builtins.readFile ./vim-plugins.json);

  mkPlugin =
    name: attrs:
    with attrs;
    with pkgs;
    vimUtils.buildVimPlugin {
      inherit name version;

      src = fetchFromGitHub {
        inherit
          hash
          owner
          repo
          rev
          ;
      };
    };
in
lib.mapAttrs mkPlugin pluginsData
