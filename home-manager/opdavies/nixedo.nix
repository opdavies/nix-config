{ pkgs, ... }:

{
  imports = [
    ./nixedo/email-filters.nix
  ];

  home.packages = with pkgs; [
    import-to-jellyfin
    vic
    yt-dlp
  ];
}
