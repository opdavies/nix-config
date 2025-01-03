local ls = require "luasnip"

local fmt = require("luasnip.extras.fmt").fmt

local f, i = ls.function_node, ls.insert_node

return {
  req = fmt([[local {} = require "{}"]], {
    f(function(import_name)
      local parts = vim.split(import_name[1][1], ".", true)

      return parts[#parts] or ""
    end, { 1 }),
    i(1),
  }),
}
