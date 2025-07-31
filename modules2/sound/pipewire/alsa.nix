{
  flake.modules.nixos.desktop.services.pipewire.alsa = {
    enable = true;
    support32Bit = true;
  };
}
