local set = vim.keymap.set

set("n", "<C-f>", "<cmd>silent !tmux new-window tmux-sessionizer<CR>")

-- Execute Lua in the current file, line or range.
set("n", "<leader><leader>x", "<cmd>source %<CR>")
set("n", "<leader>x", ":.lua<CR>")
set("v", "<leader>x", ":lua<CR>")

-- Yank from the current column to the end of the line
set("n", "Y", "yg$")

-- Keep things centred
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- Disable up and down arrow keys.
set("v", "<down>", "<nop>")
set("v", "<up>", "<nop>")

-- Easily switch back to visual mode.
set("i", "jj", "<Esc>")
set("i", "jk", "<Esc>")

-- Easy insertion of a trailing ; or , from insert mode
set("i", ",,", "<Esc>A,<Esc>")
set("i", ";;", "<Esc>A;<Esc>")

-- Automatically resize buffers.
set("n", "<leader>=", ":wincmd =<cr>", { noremap = true, silent = true })

-- Move line(s) up and down.
local opts = { noremap = true, silent = true }
set("i", "<M-j>", "<Esc>:m .+1<CR>==gi", opts)
set("i", "<M-k>", "<Esc>:m .-2<CR>==gi", opts)
set("n", "<M-j>", ":m .+1<CR>==", opts)
set("n", "<M-k>", ":m .-2<CR>==", opts)
set("v", "<M-j>", ":m '>+1<CR>gv=gv", opts)
set("v", "<M-k>", ":m '<-2<CR>gv=gv", opts)

-- Re-centre when navigating.
set("n", "#", "#zz", opts)
set("n", "%", "%zz", opts)
set("n", "*", "*zz", opts)
set("n", "<C-d>", "<C-d>zz", opts)
set("n", "<C-i>", "<C-i>zz", opts)
set("n", "<C-o>", "<C-o>zz", opts)
set("n", "<C-u>", "<C-u>zz", opts)
set("n", "G", "Gzz", opts)
set("n", "N", "Nzz", opts)
set("n", "gg", "ggzz", opts)
set("n", "n", "Nzz", opts)
set("n", "{", "{zz", opts)
set("n", "}", "}zz", opts)

-- Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
vim.cmd [[ nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}() ]]

-- Quicker macro playback.
set("n", "Q", "@qj")
set("x", "Q", ":norm @q<CR>")

set("v", "Q", "<nop>")

set("v", "J", ":m '>+1<CR>gvrgv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("n", "<leader>ec", ":edit composer.json<CR>")
set("n", "<leader>ef", ":edit flake.nix<CR>")
set("n", "<leader>ej", ":edit justfile<CR>")
set("n", "<leader>en", ":edit notes.txt<CR>")
set("n", "<leader>er", ":edit run<CR>")
set("n", "<leader>et", ":edit todo.txt<CR>")

set({ "n", "v" }, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

-- Re-add functionality to open the URL under the cursor.
-- This is overridden by mini.operators to exchange text regions.
vim.keymap.set("n", "<leader>gx", function()
  local url = vim.fn.expand "<cfile>"
  vim.fn["netrw#BrowseX"](url, 0)
end, { desc = "Open URL under cursor" })
