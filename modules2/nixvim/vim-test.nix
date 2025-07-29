{
  flake.modules.nixvim.custom = {
    plugins.vim-test.enable = true;

    keymaps = [
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
  };
}
