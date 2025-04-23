{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.homeManagerModules.cli.bluetuith;
in
{
  options.homeManagerModules.cli.bluetuith.enable = mkEnableOption "Enable bluetuith";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      bluetuith
    ];

    xdg.configFile."bluetuith/bluetuith.conf" = {
      text = ''
        {
          adapter: ""
          adapter-states: ""
          connect-bdaddr: ""
          gsm-apn: ""
          gsm-number: ""

          keybindings: {
            NavigateDown: j
            NavigateUp: k
          }

          receive-dir: ""
          theme: {}
        }
      '';
    };
  };
}
