{ pkgs, ... }:

{
  hardware.bluetooth.enable = true;

  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    bluetuith
  ];

  home-manager.users.opdavies = {
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
