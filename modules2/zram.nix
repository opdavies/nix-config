{
  flake.modules.nixos.pc.zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 90;
  };
}
