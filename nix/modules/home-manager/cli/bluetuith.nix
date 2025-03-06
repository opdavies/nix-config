{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.homeManagerModules.bluetuith.enable = mkEnableOption "Enable bluetuith";

  config = mkIf config.homeManagerModules.bluetuith.enable {
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
