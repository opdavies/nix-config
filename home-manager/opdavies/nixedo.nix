{ pkgs, ... }:

{
  imports = [
    ../common

    ./nixedo/email-filters.nix
  ];

  features.cli = {
    starship.enable = true;
    zsh.enable = true;
  };

  home.packages = with pkgs; [
    import-to-jellyfin
    vix
    yt-dlp
  ];
}
