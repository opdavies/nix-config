{ config, lib, pkgs, ... }:

let
  cfg = config.cli.${service};
  service = "sxhkd";

  inherit (lib) getExe mkIf mkEnableOption;
in
{
  options.cli.${service} = {
    enable = mkEnableOption "Enable ${service}";
  };

  config = mkIf cfg.enable {
    services.${service} = {
      enable = true;

      keybindings = {
        "{_,shift + ,super + }XF86MonBrightness{Down,Up}" = "${getExe pkgs.brightnessctl} set {5%-,10%-,10%,+5%,+10%,100%} --quiet";
        "super + x; {1,2,3}" = "st {newsboat,nmtui,bluetuith}";
      };
    };
  };
}
