require("luasnip.session.snippet_collection").clear_snippets "php"

local ls = require "luasnip"

local c = ls.choice_node
local i = ls.insert_node
local s = ls.snippet
local t = ls.text_node

local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("php", {
  s("func", fmta("function <>(<>)<> {\n  <>\n}<>", { i(1), i(2), i(3), i(4), i(0) })),

  s(
    "met",
    fmta(
      [[
      <> function <>(<>)<> {
        <>
      }<>
      ]],
      { c(1, { t "public", t "protected", t "private" }), i(2), i(3), i(4), i(5), i(0) }
    )
  ),

  s("pest", fmta("<>('<>', function() {\n  <>\n});", { c(1, { t "it", t "test" }), i(2), i(0) })),

  s(
    "test",
    fmta(
      [[
      public function test<>(): void {
        <>
      }<>
      ]],
      { i(1), i(2), i(0) }
    )
  ),

  s(
    "testan",
    fmta(
      [[
      /** @test */
      public function <>(): void {
        <>
      }<>
      ]],
      { i(1), i(2), i(0) }
    )
  ),

  s(
    "testat",
    fmta(
      [[
      [#Test]
      public function <>(): void {
        <>
      }<>
      ]],
      { i(1), i(2), i(0) }
    )
  ),
})
