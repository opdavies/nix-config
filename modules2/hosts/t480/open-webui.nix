{
  nixpkgs.allowedUnfreePackages = [ "open-webui" ];

  flake.modules.nixos.pc.services.open-webui.enable = true;
}
