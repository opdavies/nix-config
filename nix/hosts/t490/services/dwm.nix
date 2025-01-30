{ pkgs, ... }:

{
  services = {
    dwm-status = {
      enable = true;

      order = [
        "audio"
        "backlight"
        "battery"
        "cpu_load"
        "network"
        "time"
      ];
    };

    xserver.windowManager.dwm.enable = true;
  };

  environment.systemPackages = with pkgs; [
    dmenu
    dmenu-bluetooth
    networkmanager_dmenu
    st
  ];
}
