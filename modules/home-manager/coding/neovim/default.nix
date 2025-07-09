{
  config,
  inputs,
  lib,
  ...
}:

with lib;

let
  cfg = config.features.coding.neovim;
in
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  options.features.coding.neovim.enable = mkEnableOption "Enable neovim";

  config = mkIf cfg.enable {
    programs.nixvim = {
      enable = true;

      viAlias = true;
      vimAlias = true;

      imports = [ ./config ];
    };
  };
}
