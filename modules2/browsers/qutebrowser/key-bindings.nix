{ lib, ... }:

{
  flake.modules.homeManager.gui.programs.qutebrowser.keyBindings.normal = {
    "<Ctrl-d>" = "config-cycle colors.webpage.darkmode.enabled true false";

    "xb" = "config-cycle statusbar.show always never";
    "xt" = "config-cycle tabs.show always never";
    "xx" = lib.mkMerge [
      "config-cycle statusbar.show always never"
      "config-cycle tabs.show always never"
    ];
  };
}
