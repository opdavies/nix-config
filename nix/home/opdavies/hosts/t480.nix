{ pkgs, ... }:

{
  homeManagerModules = {
    bluetuith.enable = true;
    direnv.enable = true;
    discord.enable = true;
    dwm.enable = true;
    flameshot.enable = true;
    gimp.enable = true;
    gtk.enable = true;
    handbrake.enable = true;
    kdenlive.enable = true;
    mpv.enable = true;
    neovim.enable = true;
    newsboat.enable = true;

    notes = {
      enable = true;
      directory = "$HOME/Documents/wiki/notes";
    };

    pocket-casts.enable = true;
    slack.enable = true;
    tmux.enable = true;
    tmux-sessionizer.enable = true;
    zoom.enable = true;
  };

  home.packages = with pkgs; [
    displayselect
    isync
    upload-to-files
  ];

  programs.neomutt = {
    enable = true;

    vimKeys = true;
  };
}
