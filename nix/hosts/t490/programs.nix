{ pkgs, ... }:

{
  programs = {
    dconf.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-qt;
    };
  };
}
