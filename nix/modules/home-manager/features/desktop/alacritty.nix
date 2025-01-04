{
  config,
  lib,
  ...
}:

with lib;

{
  options.features.desktop.alacritty.enable = mkEnableOption "Enable Alacritty";

  config = mkIf config.features.desktop.alacritty.enable {
    programs.alacritty = {
      enable = true;

      settings = {
        env = {
          TERM = "screen-256color";
        };

        colors.primary.background = "#000000";

        window.padding = {
          x = 10;
          y = 10;
        };

        font = {
          size = 15;

          normal.family = "JetBrainsMono Nerd Font ";
        };

        terminal.shell = {
          program = "zsh";
        };
      };
    };
  };
}
