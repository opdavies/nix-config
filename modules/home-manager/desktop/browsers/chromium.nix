{ config, lib, ... }:

let
  cfg = config.desktop.browsers.${name};
  name = "chromium";

  inherit (lib) mkEnableOption mkIf;
in
{
  options.desktop.browsers.${name}.enable = mkEnableOption "Enable ${name}";

  config = mkIf cfg.enable {
    programs.${name}.enable = true;
  };
}
