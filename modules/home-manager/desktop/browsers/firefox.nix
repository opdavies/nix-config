{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.features.desktop.browsers.firefox;
in
{
  options.features.desktop.browsers.firefox = {
    enable = mkEnableOption "Enable firefox";

    homepageUrl = mkOption {
      description = "The homepage URL.";
      type = types.nullOr types.str;
    };
  };

  config = mkIf cfg.enable {
    programs.firefox.enable = false;

    programs.librewolf = {
      enable = true;

      languagePacks = [ "en-GB" ];

      policies = {
        CaptivePortal = false;
        DisableFirefoxAccounts = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;

        EnableTrackingProtection = {
          Cryptomining = true;
          Fingerprinting = true;
          Value = true;
        };

        ExtensionSettings = {
          "jid1-ZAdIEUB7XOzOJw@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/duckduckgo-for-firefox/latest.xpi";
            installation_mode = "force_installed";
          };

          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
        };

        FirefoxHome = {
          Highlights = false;
          Pocket = false;
          Search = true;
          Snippets = false;
          SponsoredPocket = false;
          SponsoredTopSites = false;
          TopSites = true;
        };

        FirefoxSuggest = {
          ImproveSuggest = false;
          SponsoredSuggestions = false;
          WebSuggestions = false;
        };

        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
        PasswordManagerEnabled = false;

        Preferences = {
          "browser.newtabpage.enabled" = false;
          "browser.startup.homepage" = cfg.homepageUrl;
          "cookiebanners.service.mode" = 2; # Block cookie banners
          "cookiebanners.service.mode.privateBrowsing" = 2; # Block cookie banners in private browsing
          "privacy.donottrackheader.enabled" = true;
          "privacy.fingerprintingProtection" = true;
          "privacy.resistFingerprinting" = true;
          "privacy.trackingprotection.emailtracking.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.fingerprinting.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
        };

        HardwareAcceleration = true;
        TranslateEnabled = true;

        UserMessaging = {
          ExtensionRecommendations = false;
          UrlbarInterventions = false;
          SkipOnboarding = true;
        };
      };

      profiles = {
        default = {
          extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
            awesome-rss
            bitwarden
            darkreader
            onetab
            tree-style-tab
            ublock-origin
            videospeed
            vimium
            web-developer
          ];

          search = {
            default = "ddg";
            force = true;
            privateDefault = "ddg";
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
  };
}
