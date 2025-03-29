{
  inputs = {
    agenix.url = "github:ryantm/agenix";

    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko";
    };

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-2405.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-2411.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    nur.url = "github:nix-community/NUR";
  };

  outputs =
    {
      agenix,
      disko,
      nixos-hardware,
      nixos-wsl,
      nixpkgs,
      self,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      username = "opdavies";

      specialArgs = {
        headless = false;

        inherit
          inputs
          outputs
          self
          system
          username
          ;
      };

      inherit (pkgs) mkShell;
    in
    {
      packages.${system} = {
        default = mkShell { buildInputs = with pkgs; [ bashInteractive ]; };
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;

      overlays = import ./overlays { inherit inputs; };

      nixosModules.default = ./modules/nixos;

      homeManagerModules.default = ./modules/home-manager;

      nixosConfigurations = {
        lemp11 = nixpkgs.lib.nixosSystem {
          specialArgs = specialArgs // {
            hostname = "lemp11";
            stateVersion = "22.11";
          };

          modules = [
            agenix.nixosModules.default

            ./hosts/lemp11/configuration.nix
          ];
        };

        nixedo = nixpkgs.lib.nixosSystem {
          specialArgs = specialArgs // {
            headless = true;
            hostname = "nixedo";
            stateVersion = "24.11";
          };

          modules = [
            agenix.nixosModules.default

            ./hosts/nixedo/configuration.nix
          ];
        };

        t480 = nixpkgs.lib.nixosSystem {
          specialArgs = specialArgs // {
            hostname = "t480";
            stateVersion = "22.11";
          };

          modules = [
            agenix.nixosModules.default
            nixos-hardware.nixosModules.common-gpu-intel
            nixos-hardware.nixosModules.lenovo-thinkpad-t480

            ./hosts/t480/configuration.nix
          ];
        };

        t490 = nixpkgs.lib.nixosSystem {
          specialArgs = specialArgs // {
            hostname = "t490";
            stateVersion = "22.11";
          };

          modules = [
            agenix.nixosModules.default
            nixos-hardware.nixosModules.common-gpu-intel
            nixos-hardware.nixosModules.lenovo-thinkpad-t490

            ./hosts/t490/configuration.nix
          ];
        };

        PW05CH3L = nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = specialArgs // {
            headless = true;
            hostname = "PW05CH3L";
            stateVersion = "22.11";
          };

          modules = [
            agenix.nixosModules.default
            disko.nixosModules.disko
            nixos-wsl.nixosModules.default

            ./hosts/PW05CH3L/configuration.nix
          ];
        };

        hetznix = nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = specialArgs // {
            headless = true;
          };

          modules = [
            agenix.nixosModules.default
            disko.nixosModules.disko

            ./hosts/hetznix/configuration.nix
          ];
        };
      };
    };
}
