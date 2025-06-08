{
  keymaps = [
    {
      action = "<Esc>A,<Esc>";
      key = ",,";
      mode = "i";
    }

    {
      action = "<Esc>A;<Esc>";
      key = ";;";
      mode = "i";
    }

    {
      action = "<cmd>lua vim.lsp.buf.format()<CR>";
      key = "<leader>f";
      options.silent = true;
    }

    {
      action = "\"+y";
      key = "<leader>y";
      mode = ["n" "x"];
    }

    {
      action = "@q";
      key = "Q";
    }

    {
      action = "<cmd>silent !tmux new-window tmux-sessionizer<CR>";
      key = "<C-f>";
      options.silent = true;
    }

    {
      action = "<Esc>:w<CR>";
      key = "<C-s>";
      mode = ["i" "n"];
    }

    {
      action = "<cmd>tabnew<CR>";
      key = "<C-t>";
    }

    {
      action = "<cmd>!composer install<CR>";
      key = "<leader>ci";
    }

    {
      action = "<cmd>edit composer.json<CR>";
      key = "<leader>ec";
    }

    {
      action = "<cmd>edit flake.nix<CR>";
      key = "<leader>ef";
    }
  ];
}
