{ config, ... }:

{
  flake.modules.nixos."hosts/t490".imports = with config.flake.modules.nixos; [
    pc
  ];
}
