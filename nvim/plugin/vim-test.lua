local set = vim.keymap.set

local options = {
  silent = true,
}

set("n", "<leader>tf", ":TestFile<CR>", options)
set("n", "<leader>tg", ":TestVisit<CR>", options)
set("n", "<leader>tl", ":TestLast<CR>", options)
set("n", "<leader>tn", ":TestNearest<CR>", options)
set("n", "<leader>ts", ":TestSuite<CR>", options)

vim.cmd [[
  let test#php#phpunit#options = '--colors=always --testdox'
  let g:test#strategy = 'vimux'
]]
