{
  flake.modules.nixvim.custom =
    { pkgs, ... }:
    {
      extraPlugins = [ pkgs.vimPlugins.vim-highlightedyank ];

      extraConfigVim = ''
        let g:highlightedyank_highlight_duration = 100
      '';
    };
}
