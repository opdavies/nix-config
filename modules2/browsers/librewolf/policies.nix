{
  flake.modules.homeManager.gui.programs.librewolf.policies = {
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
}
