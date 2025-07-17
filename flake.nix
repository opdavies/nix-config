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
        homeManagerModules.default = import ./modules/home-manager;

        nixosModules.default = import ./modules/nixos;

        overlays = import ./overlays { inherit inputs; };
      };

      imports = [
        ./flake-modules/dev-shell.nix
        ./flake-modules/formatting.nix
        ./flake-modules/nixos-configurations.nix
        ./flake-modules/packages.nix
      ];

      systems = [ "x86_64-linux" ];
    };
}
