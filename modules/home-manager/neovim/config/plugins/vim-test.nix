{ config, lib, ... }:

{
  plugins.vim-test.enable = true;

  keymaps = lib.mkIf config.plugins.vim-test.enable [
    {
      key = "<leader>tf";
      action = "<cmd>TestFile<CR>";
    }
    {
      key = "<leader>tl";
      action = "<cmd>TestLast<CR>";
    }
    {
      key = "<leader>tn";
      action = "<cmd>TestNearest<CR>";
    }
  ];
}
