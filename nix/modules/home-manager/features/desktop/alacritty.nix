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

        window.padding = {
          x = 10;
          y = 10;
        };

        font = {
          size = 16;

          bold.style = "Regular";
          bold_italic.style = "Regular";
          italic.style = "Regular";
          normal.family = "Terminus (TTF)";
        };

        terminal.shell = {
          program = "zsh";
        };
      };
    };
  };
}
