-- Example: expanding a snippet on a new line only.
-- In a snippet file, first require the line_begin condition...
local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- ...then add `condition=line_begin` to any snippet's `opts` table:
return {
  s(
    { trig = "h1", dscr = "Top-level section" },
    fmta([[\section{<>}]], { i(1) }),
    { condition = line_begin } -- set condition in the `opts` table
  ),

  s(
    { trig = "new", dscr = "A generic new environmennt" },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),
}
