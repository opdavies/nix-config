{ config, ... }:

{
  flake.modules.nixos."hosts/t480".imports = with config.flake.modules.nixos; [
    pc
  ];
}
