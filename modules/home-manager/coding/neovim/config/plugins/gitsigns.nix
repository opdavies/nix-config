{ config, lib, ... }:

{
  plugins.gitsigns.enable = true;

  keymaps = lib.mkIf config.plugins.gitsigns.enable [
    {
      action = "<cmd>Gitsigns prev_hunk<CR>";
      key = "[h";
    }

    {
      action = "<cmd>Gitsigns next_hunk<CR>";
      key = "]h";
    }

    {
      action = "<cmd>Gitsigns reset_hunk<CR>";
      key = "<leader>hr";
    }

    {
      action = "<cmd>Gitsigns reset_buffer<CR>";
      key = "<leader>hR";
    }

    {
      action = "<cmd>Gitsigns stage_hunk<CR>";
      key = "<leader>hs";
      mode = [
        "n"
        "v"
      ];
    }

    {
      action = "<cmd>Gitsigns stage_buffer<CR>";
      key = "<leader>hS";
      mode = "n";
    }

    {
      action = "<cmd>Gitsigns undo_stage_hunk<CR>";
      key = "<leader>hu";
      mode = "x";
    }
  ];
}
