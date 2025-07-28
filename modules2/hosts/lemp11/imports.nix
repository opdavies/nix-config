{ config, ... }:

{
  flake.modules.nixos."nixosConfigurations/lemp11".imports = with config.flake.modules.nixos; [
    pc
  ];
}
