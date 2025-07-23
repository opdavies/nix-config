{ config, ... }:

{
  flake.modules.nixos."hosts/lemp11".imports = with config.flake.modules.nixos; [
    pc
  ];
}
