require("luasnip.session.snippet_collection").clear_snippets "scss"

local ls = require "luasnip"

local i = ls.insert_node
local s = ls.snippet

local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("scss", {
  s("bp", fmta("@include breakpoint(<>) {\n  <>\n}", { i(1), i(0) })),
})
