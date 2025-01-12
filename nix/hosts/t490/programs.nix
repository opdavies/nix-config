{ pkgs, ... }:

{
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-qt;
    };

    firefox = {
      enable = true;

      languagePacks = [ "en-GB" ];

      preferences = {
        "intl.accept_languages" = "en-GB, en";
        "intl.regional_prefs.use_os_locales" = true;
      };
    };
  };
}
