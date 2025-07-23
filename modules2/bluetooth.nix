{
  flake.modules.nixos.pc = {
    hardware.bluetooth.enable = true;

    services.blueman.enable = true;
  };
}
