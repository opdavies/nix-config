{ config, ... }:

{
  flake.modules.nixos."nixosConfigurations/PW05CH3L".imports = with config.flake.modules.nixos; [
    pc
  ];
}
