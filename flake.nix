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
        default = mkShell { buildInputs = with pkgs; [ just ]; };
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;

      overlays = import ./overlays { inherit inputs; };

      nixosConfigurations = {
        lemp11 = nixpkgs.lib.nixosSystem {
          specialArgs = specialArgs // {
            hostname = "lemp11";
            stateVersion = "22.11";
          };

          modules = [
            agenix.nixosModules.default
            nixos-hardware.nixosModules.common-cpu-intel
            nixos-hardware.nixosModules.common-gpu-intel
            nixos-hardware.nixosModules.common-pc-laptop
            nixos-hardware.nixosModules.common-pc-laptop-hdd
            nixos-hardware.nixosModules.system76

            ./hosts/lemp11/configuration.nix
          ];
        };

        nixedo = nixpkgs.lib.nixosSystem {
          specialArgs = specialArgs // {
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
            hostname = "PW05CH3L";
            stateVersion = "22.11";
          };

          modules = [
            agenix.nixosModules.default
            disko.nixosModules.disko
            inputs.nixos-wsl.nixosModules.default

            ./hosts/PW05CH3L/configuration.nix
          ];
        };

        hetznix = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            agenix.nixosModules.default
            disko.nixosModules.disko

            ./hosts/hetznix/configuration.nix
          ];
        };
      };

      nixosModules = import ./modules { lib = nixpkgs.lib; };
    };
}
