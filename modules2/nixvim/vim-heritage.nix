{ inputs, ... }:

{
  flake.modules.nixvim.custom =
    { pkgs, ... }:
    {
      extraPlugins = [
        (pkgs.vimUtils.buildVimPlugin {
          src = inputs.vim-heritage;
          pname = "vim-heritage";
          version = "unstable";
        })
      ];

      keymaps = [
        # https://github.com/jessarcher/vim-heritage/blob/574baeb0679681a710adce5110a0d8b2ae1c2637/README.md#L28-L33
        {
          action = ":edit %:h/<cfile><cr>";
          key = "gf";
          mode = "n";
          options.silent = true;
        }
      ];
    };
}
