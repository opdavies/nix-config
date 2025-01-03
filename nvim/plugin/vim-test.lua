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

  function! TmuxStrategy(cmd)
    let l:escaped_cmd = substitute(a:cmd, ' ', '\\ ', 'g')

    execute 'silent !tmux send-keys -t .bottom ' . l:escaped_cmd . ' Enter'
  endfunction

  let g:test#custom_strategies = {'tmux': function('TmuxStrategy')}
  let g:test#strategy = 'tmux'
]]
