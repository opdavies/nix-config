# Based on https://github.com/MatthewCroughan/nixcfg/blob/afab322e6da20cc038d8577dd4a365673702d183/modules/default.nix.
# Autoloads files within modules/ and makes them available by their module
# type and name, e.g. `mixins-zsh`, `editor-nvim` and `users-opdavies` when
# imported with `inputs.self.nixosModules`.

{ lib }:

let
  inherit (builtins)
    attrNames
    filter
    listToAttrs
    map
    readDir
    toString
    ;

  inherit (lib)
    filterAttrs
    foldAttrs
    hasSuffix
    mapAttrsToList
    nameValuePair
    removeSuffix
    zipListsWith
    ;

  inherit (lib.filesystem) listFilesRecursive;

  generateModules =
    folder: prefix:

    let
      findSuffix = suffix: dir: (filter (x: (hasSuffix suffix (toString x))) (listFilesRecursive dir));

      allNixFiles = findSuffix ".nix" folder;

      allModuleNames = map (removeSuffix ".nix") (map baseNameOf allNixFiles);

      zippedList = (
        zipListsWith (x: y: nameValuePair (prefix + "-" + x) (import y)) allModuleNames allNixFiles
      );
    in
    listToAttrs zippedList;
  generateModulesAuto =
    root:
    let
      moduleFolderNames = attrNames (filterAttrs (n: v: v == "directory") (readDir (toString root)));
      moduleFolderPaths = map (x: (toString root) + "/" + x) moduleFolderNames;

      zippedList = listToAttrs (
        zipListsWith (x: y: nameValuePair x y) moduleFolderNames moduleFolderPaths
      );
    in
    foldAttrs (item: acc: item) { } (mapAttrsToList (n: v: generateModules v n) zippedList);
in
generateModulesAuto ./.
