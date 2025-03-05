{ lib, config, ... }:

with lib;

{
  options.nixosModules.docker.enable = mkEnableOption "Enable Docker";

  config = mkIf config.nixosModules.docker.enable {
    virtualisation.docker = {
      enable = true;

      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };
  };
}
