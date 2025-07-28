{ config, ... }:

{
  flake.modules.nixos."nixosConfigurations/t490".imports = with config.flake.modules.nixos; [
    pc
  ];
}
