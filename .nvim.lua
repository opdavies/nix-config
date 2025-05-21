vim.keymap.set("n", "<leader>fn", function()
  require("telescope.builtin").find_files({
    cwd = "modules/home-manager/coding/neovim/config"
  })
end)
