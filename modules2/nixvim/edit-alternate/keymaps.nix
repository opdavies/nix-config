{
  flake.modules.nixvim.custom.keymaps = [
    {
      action = "<cmd>EditAlternate<CR>";
      key = "<leader>ea";
      mode = "n";
    }
  ];
}
