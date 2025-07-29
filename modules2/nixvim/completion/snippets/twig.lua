return {
  s("do", fmta("{% <> %}<>", { i(1), i(0) })),
  s("dump", fmta("{{ dump(<>) }}<>", { i(1), i(0) })),
  s("echo", fmta("{{ <> }}<>", { i(1), i(0) })),

  s(
    "for",
    fmta(
      [[
      {% for <> in <> %}
        <>
      {% endfor %}<>
      ]],
      { i(1), i(2), i(3), i(0) }
    )
  ),

  s("if", fmta("{% if <> %}<>{% endif %}<>", { i(1), i(2), i(0) })),
}
