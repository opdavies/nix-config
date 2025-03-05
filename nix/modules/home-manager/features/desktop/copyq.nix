{ config, lib, ... }:

with lib;

{
  options.homeManagerModules.copyq.enable = mkEnableOption "Enable copyq";

  config = mkIf config.homeManagerModules.copyq.enable {
    services.copyq.enable = true;
  };
}
