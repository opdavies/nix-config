{ config, lib, ... }:

with lib;

let
  cfg = config.core.zram;
in
{
  options.core.zram.enable = mkEnableOption "Enable zram";

  config = mkIf cfg.enable {
    zramSwap = {
      enable = true;
      algorithm = "zstd";
      memoryPercent = 90;
    };
  };
}
