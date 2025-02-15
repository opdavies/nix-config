{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    languagePacks = [ "en-GB" ];

    profiles = {
      default = {
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          awesome-rss
          bitwarden
          darkreader
          onetab
          tree-style-tab
          ublock-origin
          vimium
          web-developer
        ];

        preConfig = builtins.readFile "${pkgs.arkenfox-userjs}/user.js";

        search = {
          default = "DuckDuckGo";
          force = true;
          privateDefault = "DuckDuckGo";
        };

        settings = {
          "browser.search.isUS" = false;
          "browser.search.region" = "GB";
          "distribution.searchplugins.defaultLocale" = "en-GB";
          "general.useragent.locale" = "en-GB";
          "intl.accept_languages" = "en-GB, en";
          "intl.regional_prefs.use_os_locales" = true;
        };
      };
    };
  };
}
