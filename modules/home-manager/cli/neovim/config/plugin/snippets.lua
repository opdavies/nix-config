local ls = require "luasnip"

ls.config.set_config {
  enable_autosnippets = true,
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/opdavies/snippets/*.lua", true)) do
  loadfile(ft_path)()
end

-- Expand the current item or just to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- Jump backwards.
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- Select within a list of options.
vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)
