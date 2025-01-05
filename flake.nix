{
  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    agenix.url = "github:ryantm/agenix";

    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-2405.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs =
    {
      agenix,
      disko,
      home-manager,
      nixos-hardware,
      nixos-wsl,
      nixpkgs,
      self,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

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

      overlays = import ./nix/overlays { inherit inputs; };

      nixosModules.default = ./nix/modules/nixos;

      nixosConfigurations = {
        lemp11 = nixpkgs.lib.nixosSystem {
          specialArgs = specialArgs // {
            hostname = "lemp11";
            stateVersion = "22.11";
          };

          modules = [
            agenix.nixosModules.default

            ./nix/hosts/lemp11
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

            ./nix/hosts/nixedo
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

            ./nix/hosts/t490
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

            ./nix/hosts/PW05CH3L
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

            ./nix/hosts/hetznix/configuration.nix
          ];
        };
      };
    };
}
