{ inputs, self, ... }:

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
          stateVersion ? "22.11",
          system ? "x86_64-linux",
        }:
        inputs.nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [ "${self}/hosts/${hostname}/configuration.nix" ];

          specialArgs = specialArgs // {
            inherit hostname stateVersion system;
          };
        };
    in
    {
      nixosConfigurations = {
        lemp11 = mkNixosConfiguration { hostname = "lemp11"; };

        nixedo = mkNixosConfiguration {
          hostname = "nixedo";
          stateVersion = "24.11";
        };

        t480 = mkNixosConfiguration { hostname = "t480"; };

        t490 = mkNixosConfiguration { hostname = "t490"; };

        PW05CH3L = mkNixosConfiguration { hostname = "PW05CH3L"; };
      };
    };
}
