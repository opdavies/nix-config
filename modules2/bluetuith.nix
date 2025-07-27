{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.bluetuith
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
