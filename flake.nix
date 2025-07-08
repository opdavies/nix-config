{
  inputs = {
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    agenix.url = "github:ryantm/agenix";

    disko.inputs.nixpkgs.follows = "nixpkgs";
    disko.url = "github:nix-community/disko";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nur.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/NUR";
  };

  outputs =
    { nixpkgs, self, ... }@inputs:
    let
      inherit (self) outputs;

      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      username = "opdavies";

      specialArgs = {
        inherit
          inputs
          outputs
          self
          system
          username
          ;
      };

      inherit (pkgs) mkShell;

      nixvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit pkgs;

        module = import ./modules/home-manager/coding/neovim/config;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          just
          lua-language-server
          lua54Packages.luacheck
          nixd
        ];
      };

      packages.${system} = {
        inherit nixvim;

        default = mkShell { buildInputs = with pkgs; [ just ]; };
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;

      overlays = import ./overlays { inherit inputs; };

      homeManagerModules.default = import ./modules/home-manager;

      nixosModules.default = import ./modules/nixos;

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
          inherit system;

          modules = [
            ./hosts/PW05CH3L/configuration.nix
          ];

          specialArgs = specialArgs // {
            hostname = "PW05CH3L";
            stateVersion = "22.11";
          };
        };
      };
    };
}
