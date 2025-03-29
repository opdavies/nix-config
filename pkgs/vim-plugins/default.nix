{ callPackage }:

{
  conf-vim = callPackage ./conf-vim.nix { };
  edit-alternate-vim = callPackage ./edit-alternate-vim.nix { };
  standard-vim = callPackage ./standard-vim.nix { };
  vim-caser = callPackage ./vim-caser.nix { };
  vim-textobj-indent = callPackage ./vim-textobj-indent.nix { };
  vim-textobj-xmlattr = callPackage ./vim-textobj-xmlattr.nix { };
}
