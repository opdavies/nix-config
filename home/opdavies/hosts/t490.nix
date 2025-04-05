{ pkgs, ... }:

{
  homeManagerModules = {
    notes = {
      enable = true;
      directory = "$HOME/Documents/wiki/notes";
    };

    tmux.enable = true;
    tmux-sessionizer.enable = true;
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
