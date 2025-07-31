{
  nixpkgs.allowedUnfreePackages = [ "open-webui" ];

  flake.modules.nixos.desktop.services.open-webui.enable = true;
}
