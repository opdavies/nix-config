require("luasnip.session.snippet_collection").clear_snippets "javascript"

local ls = require "luasnip"

local i = ls.insert_node
local s = ls.snippet

local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("javascript", {
  s("log", fmta("console.log(<>);", { i(1, "value") })),
})
