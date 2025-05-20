vim.diagnostic.config {
  float = { source = true },
  signs = true,
  underline = false,
  update_in_insert = false,
  virtual_text = { spacing = 2 },
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    local builtin = require "telescope.builtin"

    vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
    vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = 0 })

    vim.keymap.set("n", "<leader>dl", vim.diagnostic.setqflist, { buffer = 0 })
  end,
})
