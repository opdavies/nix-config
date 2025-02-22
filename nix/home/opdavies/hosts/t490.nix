{ pkgs, ... }:

{
  features = {
    cli = {
      bluetuith.enable = true;
      direnv.enable = true;
      neovim.enable = true;

      notes = {
        enable = true;

        directory = "$HOME/Documents/wiki/notes";
      };

      syncthing.enable = true;
      tmux.enable = true;
      tmux-sessionizer.enable = true;
    };

    desktop = {
      copyq.enable = true;
      discord.enable = true;
      dwm.enable = true;
      espanso.enable = true;
      flameshot.enable = true;
      gtk.enable = true;
      slack.enable = true;

      media = {
        gimp.enable = true;
        handbrake.enable = true;
        kdenlive.enable = true;
        pocket-casts.enable = true;
        mpv.enable = true;
      };

      zoom.enable = true;
    };
  };

  home.packages = with pkgs; [
    isync
    upload-to-files
  ];

  programs.neomutt = {
    enable = true;

    vimKeys = true;
  };
}
