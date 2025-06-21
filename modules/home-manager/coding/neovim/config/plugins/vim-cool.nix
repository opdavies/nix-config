{ pkgs, ... }:

{
  extraPlugins = with pkgs.vimPlugins; [ vim-cool ];
}
