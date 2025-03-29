{ config, pkgs, ... }:

{
  home.username = "opdavies";
  home.homeDirectory = "/home/${config.home.username}";

  home.stateVersion = "22.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    cachix
    delta
    entr
    gcc
    git
    git-crypt
    gnupg
    inotify-tools
    jq
    killall
    lua
    mob
    pv
    simple-http-server
    sshs
    tldr
    tree
    tree-sitter
    unzip
    w3m
    watchexec
    wget
    xclip
    xdg-utils
    zbar
  ];

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs.
  systemd.user.startServices = "sd-switch";
}
