require("luasnip.session.snippet_collection").clear_snippets "rst"

local ls = require "luasnip"

local i = ls.insert_node
local f = ls.function_node
local s = ls.snippet
local t = ls.text_node

local fmta = require("luasnip.extras.fmt").fmta

local fill_line = function(char)
  return function()
    local row = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_get_lines(0, row - 2, row, false)
    return string.rep(char, #lines[1])
  end
end

ls.add_snippets("rst", {
  s("class", t(".. class:: ", i(1))),

  s("footer", t(".. footer:: ", i(1))),

  s("link", t(".. _", i(1), ":")),

  s("raw", t(".. raw:: ", i(1))),

  -- TODO: add an optional new line and ":width" property.
  s("image", t(".. image:: ", i(1))),

  s("head", f(fill_line "=", {})),

  s("sub", f(fill_line "-", {})),

  s("subsub", f(fill_line "^", {})),

  -- Add a page break with an optional page template.
  s(
    "pb",
    fmta(
      [[
      .. raw:: pdf

         PageBreak<>
      ]],
      { i(0) }
    )
  ),

  -- Add a new speaker note.
  s(
    "ta",
    fmta(
      [[
      .. raw:: pdf

         TextAnnotation "<>"
      ]],
      { i(0) }
    )
  ),
})
