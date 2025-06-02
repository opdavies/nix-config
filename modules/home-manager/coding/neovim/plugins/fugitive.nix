{ config, lib, ... }:

{
  plugins.fugitive.enable = true;

  keymaps = lib.mkIf config.plugins.fugitive.enable [
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
}
