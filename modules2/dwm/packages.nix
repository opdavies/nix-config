{
  flake.modules.nixos.pc =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        dmenu
        dmenu-bluetooth
        dunst
        networkmanager_dmenu
        poweralertd
        slock
        xdotool
        xwallpaper
      ];
    };
}
