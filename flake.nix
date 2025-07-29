{
  inputs = {
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    agenix.url = "github:ryantm/agenix";

    conf-vim.flake = false;
    conf-vim.url = "github:tjdevries/conf.vim";

    disko.inputs.nixpkgs.follows = "nixpkgs";
    disko.url = "github:nix-community/disko";

    edit-alternate-vim.flake = false;
    edit-alternate-vim.url = "github:tjdevries/edit_alternate.vim";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";

    import-tree.url = "github:vic/import-tree";

    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    nix-index-database.url = "github:nix-community/nix-index-database";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    nixvim.inputs.flake-parts.follows = "flake-parts";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nur.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/NUR";

    standard-vim.flake = false;
    standard-vim.url = "github:tjdevries/standard.vim";

    vim-textobj-xmlattr.flake = false;
    vim-textobj-xmlattr.url = "github:whatyouhide/vim-textobj-xmlattr";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        nixosModules.default = import ./modules/nixos;

        overlays = import ./overlays { inherit inputs; };
      };

      imports = [ (inputs.import-tree ./modules2) ];
    };
}
