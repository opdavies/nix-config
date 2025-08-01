{ inputs, ... }:

{
  flake.modules.nixos.pc =
    { system, ... }:
    {
      environment.systemPackages = [
        inputs.git-repo-updater.packages.${system}.default
      ];
    };
}
