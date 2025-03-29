{ pkgs, ... }:

{
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-qt;
    };

    zsh = {
      enable = true;
      histSize = 5000;
    };
  };
}
