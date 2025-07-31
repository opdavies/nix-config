{ config, ... }:

{
  flake.modules.nixos."nixosConfigurations/t480".imports = with config.flake.modules.nixos; [
    desktop
  ];
}
