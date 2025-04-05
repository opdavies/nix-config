{ lib, ... }:

with lib;

{
  home-manager.users.opdavies = {
    programs.qutebrowser = {
      enable = true;

      searchEngines = {
        dp = "https://www.drupal.org/project/{}";
        du = "https://www.drupal.org/u/{}";
        gh = "https://github.com/search?q={}";
        mn = "https://mynixos.com/search?q={}";
        nx = "https://search.nixos.org/packages?query={}";
      };

      settings = {
        colors.webpage.darkmode.enabled = true;
      };

      keyBindings = {
        normal = {
          "<Ctrl-d>" = "config-cycle colors.webpage.darkmode.enabled true false";

          "xb" = "config-cycle statusbar.show always never";
          "xt" = "config-cycle tabs.show always never";
          "xx" = mkMerge [
            "config-cycle statusbar.show always never"
            "config-cycle tabs.show always never"
          ];
        };
      };
    };
  };
}
