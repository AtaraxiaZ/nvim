-- Tips:
-- 1. fmta function is more convenient for LaTeX, which itself
-- uses curly braces to specify command and environment arguments
-- 2. explicitly-specified i(0) node makes you exit the snippet

-- 3. you can integrate VimTeX’s math zone detection with
-- LuaSnip’s condition feature
local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual

local tex_utils = {}
tex_utils.in_mathzone = function() -- math context detection
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function() -- comment detection
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
  local is_inside = vim.fn["vimtex#env#is_inside"](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function() -- equation environment detection
  return tex_utils.in_env("equation")
end
tex_utils.in_itemize = function() -- itemize environment detection
  return tex_utils.in_env("itemize")
end
tex_utils.in_tikz = function() -- TikZ picture environment detection
  return tex_utils.in_env("tikzpicture")
end

return {
  -- Examples of complete snippets using fmt and fmta

  -- \texttt
  s({ trig = "tt", dscr = "Expands 'tt' into '\texttt{}'" }, fmta("\\texttt{<>}", { i(1) })),

  -- \frac
  s(
    { trig = "ff", dscr = "Expands 'ff' into '\frac{}{}'" },
    fmt(
      "\\frac{<>}{<>}",
      {
        i(1),
        i(2),
      },
      { delimiters = "<>" } -- manually specifying angle bracket delimiters
    )
  ),

  -- Equation
  s(
    { trig = "eq", dscr = "Expands 'eq' into an equation environment" },
    fmta(
      [[
       \begin{equation*}
           <>
       \end{equation*}
     ]],
      { i(1) }
    )
  ),

  -- general environment
  s(
    { trig = "env", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1), -- this node repeats insert node i(1)
      }
    )
  ),

  s(
    { trig = "hr", dscr = "The hyperref package's href{}{} command (for url links)" },
    fmta([[\href{<>}{<>}]], {
      i(1, "url"),
      i(2, "display name"),
    })
  ),

  s(
    { trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command." },
    fmta("\\textit{<>}", {
      d(1, get_visual),
    })
  ),

  -- Expand 'dd' into \draw, but only in TikZ environments
  s(
    { trig = "dd" },
    fmta("\\draw [<>] ", {
      i(1, "params"),
    }),
    { condition = tex_utils.in_tikz }
  ),
}
