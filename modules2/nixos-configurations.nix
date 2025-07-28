{
  config,
  inputs,
  self,
  ...
}:

{
  flake =
    let
      inherit (self) outputs;

      specialArgs = {
        inherit inputs outputs self;

        system = "x86_64-linux";
        username = "opdavies";
      };

      mkNixosConfiguration =
        {
          hostname,
          modules ? [ ],
          stateVersion ? "22.11",
          system ? "x86_64-linux",
        }:
        inputs.nixpkgs.lib.nixosSystem {
          inherit system;

          modules = modules ++ [
            "${self}/hosts/${hostname}/configuration.nix"
          ];

          specialArgs = specialArgs // {
            inherit hostname stateVersion system;
          };
        };
    in
    {
      nixosConfigurations = {
        lemp11 = mkNixosConfiguration rec {
          hostname = "lemp11";

          modules = [ config.flake.modules.nixos."nixosConfigurations/${hostname}" ];
        };

        nixedo = mkNixosConfiguration {
          hostname = "nixedo";
          stateVersion = "24.11";
        };

        t480 = mkNixosConfiguration rec {
          hostname = "t480";

          modules = [ config.flake.modules.nixos."nixosConfigurations/${hostname}" ];
        };

        t490 = mkNixosConfiguration rec {
          hostname = "t490";

          modules = [ config.flake.modules.nixos."nixosConfigurations/${hostname}" ];
        };

        PW05CH3L = mkNixosConfiguration rec {
          hostname = "PW05CH3L";
          modules = [ config.flake.modules.nixos."nixosConfigurations/${hostname}" ];
        };
      };
    };
}
