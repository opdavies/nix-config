{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.nixosModules.gaming.enable = mkEnableOption "Enable games";

  config = mkIf config.nixosModules.gaming.enable {
    programs.steam.enable = true;

    environment.systemPackages = with pkgs; [ zeroad ];
  };
}
