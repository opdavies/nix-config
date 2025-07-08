{
  inputs = {
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    agenix.url = "github:ryantm/agenix";

    disko.inputs.nixpkgs.follows = "nixpkgs";
    disko.url = "github:nix-community/disko";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    nixvim.inputs.flake-parts.follows = "flake-parts";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nur.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/NUR";
  };

  outputs =
    inputs@{
      flake-parts,
      nixpkgs,
      self,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake =
        let
          inherit (self) outputs;

          specialArgs = {
            inherit inputs outputs self;

            system = "x86_64-linux";
            username = "opdavies";
          };
        in
        {
          homeManagerModules.default = import ./modules/home-manager;

          nixosConfigurations = {
            lemp11 = nixpkgs.lib.nixosSystem {
              modules = [
                ./hosts/lemp11/configuration.nix
              ];

              specialArgs = specialArgs // {
                hostname = "lemp11";
                stateVersion = "22.11";
              };
            };

            nixedo = nixpkgs.lib.nixosSystem {
              modules = [
                ./hosts/nixedo/configuration.nix
              ];

              specialArgs = specialArgs // {
                hostname = "nixedo";
                stateVersion = "24.11";
              };
            };

            t480 = nixpkgs.lib.nixosSystem {
              modules = [
                ./hosts/t480/configuration.nix
              ];

              specialArgs = specialArgs // {
                hostname = "t480";
                stateVersion = "22.11";
              };
            };

            t490 = nixpkgs.lib.nixosSystem {
              modules = [
                ./hosts/t490/configuration.nix
              ];

              specialArgs = specialArgs // {
                hostname = "t490";
                stateVersion = "22.11";
              };
            };

            PW05CH3L = nixpkgs.lib.nixosSystem {
              modules = [
                ./hosts/PW05CH3L/configuration.nix
              ];

              specialArgs = specialArgs // {
                hostname = "PW05CH3L";
                stateVersion = "22.11";
              };
            };
          };

          nixosModules.default = import ./modules/nixos;

          overlays = import ./overlays { inherit inputs; };
        };

      perSystem =
        { pkgs, system, ... }:
        let
          # TODO: refactor to use inputs' or similar.
          nixvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
            inherit pkgs;

            module = import ./modules/home-manager/coding/neovim/config;
          };
        in
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              just
              lua-language-server
              lua54Packages.luacheck
              nixd
            ];
          };

          formatter = pkgs.nixfmt-rfc-style;

          packages = {
            inherit nixvim;

            default = pkgs.mkShell { buildInputs = with pkgs; [ just ]; };
          };
        };

      systems = [ "x86_64-linux" ];
    };
}
