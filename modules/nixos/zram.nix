{ config, lib, ... }:

with lib;

let
  cfg = config.features.core.zram;
in
{
  options.features.core.zram.enable = mkEnableOption "Enable zram";

  config = mkIf cfg.enable {
    zramSwap = {
      enable = true;
      algorithm = "zstd";
      memoryPercent = 90;
    };
  };
}
