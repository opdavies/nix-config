{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.nixosModules.peek.enable = mkEnableOption "Enable peek";

  config = mkIf config.nixosModules.peek.enable {
    environment.systemPackages = with pkgs; [ peek ];
  };
}
