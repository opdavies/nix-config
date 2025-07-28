{ config, ... }:

{
  flake.modules.nixos."hosts/PW05CH3L".imports = with config.flake.modules.nixos; [
    workstation
  ];
}
