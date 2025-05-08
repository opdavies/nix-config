-- TODO: Interim fix for https://github.com/nvim-treesitter/nvim-treesitter-context/issues/431.
vim.opt_local.spell = true
vim.opt_local.wrap = true

vim.keymap.set("n", "<leader>su", "Bi{{site.url}}/<Esc>")

-- Convert lines into a markdown list.
vim.keymap.set("n", "<leader>l", "vip:norm I- <CR>")
vim.keymap.set("v", "<leader>l", ":norm I- <CR>")
