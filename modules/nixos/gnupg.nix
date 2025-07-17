{ pkgs, ... }:

{
  security.pam.services.login.gnupg.enable = true;

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;

      pinentryPackage = pkgs.pinentry-qt;
    };
  };
}
