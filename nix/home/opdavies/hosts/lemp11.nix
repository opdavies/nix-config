{ ... }:

{
  features = {
    cli = {
      direnv.enable = true;
      tmux-sessionizer.enable = true;
    };

    desktop = {
      copyq.enable = true;
      discord.enable = true;
      espanso.enable = true;
      flameshot.enable = true;
      ghostty.enable = true;
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
}
