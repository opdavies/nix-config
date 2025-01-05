{ pkgs, ... }:

{
  programs.dconf.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-qt;
  };

  programs.firefox = {
    enable = true;

    languagePacks = [ "en-GB" ];

    preferences = {
      "intl.accept_languages" = "en-GB, en";
      "intl.regional_prefs.use_os_locales" = true;
    };
  };
}
