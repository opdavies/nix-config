{
  inputs = {
    agenix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:ryantm/agenix";
    };

    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/master";
    };

    import-tree.url = "github:vic/import-tree";

    nix-index-database = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nix-index-database";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    nixvim = {
      inputs.flake-parts.follows = "flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nixvim";
    };

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nur = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/NUR";
    };
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
