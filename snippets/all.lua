-- abbreviations defined by LuaSnip, can be used directly
-- local ls = require("luasnip")
-- local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local d = ls.dynamic_node
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local rep = require("luasnip.extras").rep

-- add snippets like followed
-- return {
--   s("trig", t("loaded!!")), -- lua will expand this
-- }
-- a full example
-- return {
--   -- Example: how to set snippet parameters
--   require("luasnip").snippet(
--     { -- Table 1: snippet parameters
--       trig="hi",
--       dscr="An autotriggering snippet that expands 'hi' into 'Hello, world!'",
--       regTrig=false, -- The trigger is not a lua regular expression
--       priority=100, -- default is 1000
--       snippetType="autosnippet"  -- autoexpand the snippet
--     },
--     { -- Table 2: snippet nodes (don't worry about this for now---we'll cover nodes shortly)
--       t("Hello, world!"), -- A single text node
--     }
--     -- Table 3, the advanced snippet options, is left blank.
--   ),
-- }

return {
  s(
    { trig = "MIT", desr = "MIT license header comment" },
    fmta(
      [[
        /*
        MIT License

        Copyright (c) <> Microwave System Lab @ Southeast University.

        Permission is hereby granted, free of charge, to any person obtaining a copy
        of this software and associated documentation files (the "Software"), to deal
        in the Software without restriction, including without limitation the rights
        to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
        copies of the Software, and to permit persons to whom the Software is
        furnished to do so, subject to the following conditions:

        The above copyright notice and this permission notice shall be included in all
        copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
        IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
        FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
        AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
        LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
        OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
        SOFTWARE.
        */
    ]],
      { p(os.date, "%Y") }
    )
  ),
}
