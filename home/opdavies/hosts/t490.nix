{ pkgs, ... }:

{
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
