{
  flake.modules.nixos.pc.services.pipewire.alsa = {
    enable = true;
    support32Bit = true;
  };
}
