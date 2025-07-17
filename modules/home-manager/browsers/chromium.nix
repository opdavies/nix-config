{ config, lib, ... }:

let
  cfg = config.features.desktop.browsers.${name};
  name = "chromium";

  inherit (lib) mkEnableOption mkIf;
in
{
  options.features.desktop.browsers.${name}.enable = mkEnableOption "Enable ${name}";

  config = mkIf cfg.enable {
    programs.${name}.enable = true;
  };
}
