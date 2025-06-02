{ pkgs, ... }:

{
  extraPlugins = with pkgs.vimPlugins; [ vim-highlightedyank ];

  extraConfigVim = ''
    let g:highlightedyank_highlight_duration = 100
  '';
}
