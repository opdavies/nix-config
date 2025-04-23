{ config, lib, ... }:

with lib;

let
  cfg = config.nixosModules.core.zram;
in
{
  options.nixosModules.core.zram.enable = mkEnableOption "Enable zram";

  config = mkIf cfg.enable {
    zramSwap = {
      enable = true;
      algorithm = "zstd";
      memoryPercent = 90;
    };
  };
}
