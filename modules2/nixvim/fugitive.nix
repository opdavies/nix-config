{
  flake.modules.nixvim.custom = {
    plugins.fugitive.enable = true;

    keymaps = [
      {
        key = "<leader>gc";
        action = "<cmd>Git commit<CR><C-w>K";
      }

      {
        # Open the ":Git" window in its own buffer, not a split.
        key = "<leader>gs";
        action = "<cmd>0Git<CR>";
      }
    ];
  };
}
