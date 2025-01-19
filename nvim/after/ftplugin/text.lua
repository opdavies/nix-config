local opt = vim.opt_local

opt.number = false
opt.relativenumber = false
opt.spell = true
opt.wrap = true

vim.api.nvim_create_autocmd("BufWritePre", {
  buffer = 0,
  callback = function()
    local last_line = vim.api.nvim_buf_get_lines(0, -2, -1, false)[1]

    if last_line ~= "" then
      vim.api.nvim_buf_set_lines(0, -1, -1, false, { "" })
    end
  end,
})
