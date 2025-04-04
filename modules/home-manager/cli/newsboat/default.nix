{
  config,
  lib,
  ...
}:

with lib;

{
  options.homeManagerModules.newsboat.enable = mkEnableOption "Enable newsboat";

  config = mkIf config.homeManagerModules.newsboat.enable {
    programs.newsboat = {
      enable = true;

      extraConfig = ''
        bind-key j down
        bind-key k up

        bind-key j next articlelist
        bind-key k prev articlelist
        bind-key J next-feed articlelist
        bind-key K prev-feed articlelist

        bind-key g home
        bind-key G end

        bind-key d pagedown
        bind-key u pageup

        bind-key a toggle-article-read
        bind-key n next-unread
        bind-key N prev-unread
        bind-key x pb-delete

        color info white black bold
      '';

      urls = import ./urls.nix;
    };
  };
}
