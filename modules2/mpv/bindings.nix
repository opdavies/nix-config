{
  # https://github.com/mpv-player/mpv/blob/master/etc/input.conf
  flake.modules.homeManager.gui.programs.mpv.bindings = {
    "DOWN" = "add volume -5";
    "UP" = "add volume 5";
  };
}
