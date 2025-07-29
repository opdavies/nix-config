{
  flake.modules.nixvim.custom =
    { pkgs, ... }:
    {
      extraPlugins = [ pkgs.vimPlugins.vim-cool ];
    };
}
